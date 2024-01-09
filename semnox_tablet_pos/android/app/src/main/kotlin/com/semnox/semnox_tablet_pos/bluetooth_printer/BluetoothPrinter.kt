package com.semnox.semnox_tablet_pos.bluetooth_printer

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import android.graphics.BitmapFactory
import android.util.Base64
import android.util.Log
import com.semnox.semnox_tablet_pos.utils.ConnectionSocketManager
import com.semnox.semnox_tablet_pos.utils.Sleeper
import com.zebra.sdk.comm.BluetoothConnection
import com.zebra.sdk.comm.BluetoothConnectionInsecure
import com.zebra.sdk.comm.Connection
import com.zebra.sdk.comm.ConnectionException
import com.zebra.sdk.comm.TcpConnection
import com.zebra.sdk.graphics.internal.ZebraImageAndroid
import com.zebra.sdk.printer.PrinterLanguage
import com.zebra.sdk.printer.ZebraPrinter
import com.zebra.sdk.printer.ZebraPrinterFactory
import com.zebra.sdk.printer.discovery.BluetoothDiscoverer
import com.zebra.sdk.printer.discovery.DiscoveredPrinter
import com.zebra.sdk.printer.discovery.DiscoveryHandler
import com.zebra.sdk.printer.internal.ZebraPrinterCpcl
import java.io.InputStream

class BluetoothPrinter(activity: Activity, listener: OnBluetoothPrinterStateListener) {

    var onBluetoothPrinterStateListener: OnBluetoothPrinterStateListener? = null
    private var activity: Activity? = null
    private var printerConnection: Connection? = null
    private var printer: ZebraPrinter? = null
    private var selectedAddress: String? = null
    private var macAddress: String? = null
    private var tempIsPrinterConnect = false
    private var isZebraPrinter = true
    private var socketManager: ConnectionSocketManager? = null
    private val discoveredPrinters : ArrayList<DiscoveredPrinter> = arrayListOf()
    private val sendDiscoveredPrinters : ArrayList<DiscoveredPrinter> = arrayListOf()
    private var countDiscovery = 0
    private var countEndScan = 0
    val sharedPref = activity.getPreferences(Context.MODE_PRIVATE)


    init {
        this.activity = activity
        this.onBluetoothPrinterStateListener = listener
    }

    interface OnBluetoothPrinterStateListener {
        fun onBluetoothPrinterFound(address: String)
        fun onBluetoothPrinterError(error: String)
        fun onBluetoothPrintingSuccess()
    }

    private val isPrinterConnect: String
        get() = if (isZebraPrinter) {
            tempIsPrinterConnect = true
            if (printerConnection != null && printerConnection?.isConnected == true) {
                //TODO Remove this
                /*Thread {
                    try {
                        printerConnection!!.write("Test".toByteArray())
                    } catch (e: ConnectionException) {
                        e.printStackTrace()
                        disconnect()
                        tempIsPrinterConnect = false
                    }
                }.start()*/
                if (tempIsPrinterConnect) {
                    "CONNECTED"
                } else {
                    "DISCONNECTED"
                }
            } else {
                "DISCONNECTED"
            }
        } else {
            if (socketManager != null) {
                if (socketManager?.istate == true) {
                    "CONNECTED"
                } else {
                    "DISCONNECTED"
                }
            } else {
                "DISCONNECTED"
            }
        }

    fun printReceipt(receipt: String?, receiptType: String?, isBitmap: Boolean, context: Context?) {
        /**
         * Step 1 : Search for Zebra Bluetooth Printer
         */
        try {
            val bluetoothPrinterMacAddress = sharedPref?.getString("bluetoothPrinterMacAddress","")
            /**
             * If Printer is connected, printing the receipt. Else Searching for the printer.
             */
            if(isPrinterConnect == "CONNECTED") {
                if(isBitmap) {
                    if (receiptType == "POSREPORT"){
                        /**
                         * Converting Base64 Image string to Bitmap Image/
                         */
                        val decodedString: ByteArray = Base64.decode(receipt, Base64.DEFAULT)
                        val decodedReceiptBitMap = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.size)
                        Sleeper.sleep(300)
                        /**
                         * Printing the bitmap receipt to the connected printer.
                         */
                        printerConnection?.write("! UTILITIES\r\nIN-MILLIMETERS\r\nSETFF 10 2\r\nPRINT\r\n".toByteArray())
                        val zp: ZebraPrinter = ZebraPrinterCpcl(printerConnection, PrinterLanguage.CPCL)
                        zp.printImage(
                                ZebraImageAndroid(decodedReceiptBitMap),
                                0,
                                0,
                                decodedReceiptBitMap.width + 50,
                                decodedReceiptBitMap.height + 50,
                                false
                        )
                        Sleeper.sleep(1500)
                        if (printerConnection is BluetoothConnection) {
                            Sleeper.sleep(500)
                        }
                        onBluetoothPrinterStateListener?.onBluetoothPrintingSuccess()
                    }else{
                        /**
                         * Converting Base64 Image string to Bitmap Image/
                         */
                        val decodedString: ByteArray = Base64.decode(receipt, Base64.DEFAULT)
                        val decodedReceiptBitMap = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.size)
                        Sleeper.sleep(300)

                        /**
                         * Printing the bitmap receipt to the connected printer.
                         */
                        printerConnection?.write("! UTILITIES\r\nIN-MILLIMETERS\r\nSETFF 10 2\r\nPRINT\r\n".toByteArray())
                        val zp: ZebraPrinter = ZebraPrinterCpcl(printerConnection, PrinterLanguage.CPCL)
                        zp.printImage(
                                ZebraImageAndroid(decodedReceiptBitMap),
                                0,
                                0,
                                if (receiptType == "TRANSACTION") 505 else decodedReceiptBitMap.width + 50,
                                if (receiptType == "TRANSACTION") decodedReceiptBitMap.height + 200 else decodedReceiptBitMap.height + 50,
                                false
                        )
                        Sleeper.sleep(1500)
                        if (printerConnection is BluetoothConnection) {
                            Sleeper.sleep(500)
                        }
                        onBluetoothPrinterStateListener?.onBluetoothPrintingSuccess()
                    }
                } else {

                    /**
                     * Printing the Padded string
                     */
                    val bytes: ByteArray = receipt!!.toByteArray()
                    printerConnection!!.write(bytes)
                    Sleeper.sleep(500)
                    if (printerConnection is BluetoothConnection) {
                        Sleeper.sleep(500)
                    }
                    onBluetoothPrinterStateListener?.onBluetoothPrintingSuccess()
                }
            } else {
                /**
                 * Searching for the nearby bluetooth printers.
                 */
                sendDiscoveredPrinters.clear()
                discoveredPrinters.clear()
                countEndScan = 0
                Thread {
                    BluetoothDiscoverer.findPrinters(context, object : DiscoveryHandler {
                        override fun foundPrinter(discoveredPrinter: DiscoveredPrinter) {
                            if (discoveredPrinter.address == bluetoothPrinterMacAddress) {
                                discoveredPrinters.add(discoveredPrinter)
                                (context as? Activity)?.runOnUiThread {
                                    addNewDiscoveredPrinter(
                                            discoveredPrinter,
                                            context
                                    )
                                }
                            }
                        }

                        override fun discoveryFinished() {
                            countEndScan++
                            if (discoveredPrinters.size == 0) {
                                onBluetoothPrinterStateListener?.onBluetoothPrinterError("NO BLUETOOTH PRINTERS FOUND")
                            }
                        }

                        override fun discoveryError(s: String) {
                            onBluetoothPrinterStateListener?.onBluetoothPrinterError(s)
                        }
                    })
                }.start()
                /*Handler(Looper.getMainLooper()).postDelayed({
                    if (discoveredPrinters.size == 0) {
                        onBluetoothPrinterStateListener?.onBluetoothPrinterError("NO BLUETOOTH PRINTERS FOUND")
                    }
                }, 40000)*/
            }
        } catch (e: Exception) {
            e.printStackTrace()
            onBluetoothPrinterStateListener?.onBluetoothPrinterError(e.toString())
        }
    }

    private fun addNewDiscoveredPrinter(
        discoveredPrinter: DiscoveredPrinter,
        context: Context?,
    ) {
        addPrinterToDiscoveryPrinterList(discoveredPrinter)
        (context as? Activity)?.runOnUiThread(Runnable {
            for (dp: DiscoveredPrinter in sendDiscoveredPrinters) {
                if ((dp.address == discoveredPrinter.address)) return@Runnable
            }
            sendDiscoveredPrinters.add(discoveredPrinter)
            val arguments = HashMap<String, Any?>()
            arguments["Address"] = discoveredPrinter.address
            if (discoveredPrinter.discoveryDataMap["SYSTEM_NAME"] != null) {
                arguments["Name"] = discoveredPrinter.discoveryDataMap["SYSTEM_NAME"]
                arguments["IsWifi"] = true
                onBluetoothPrinterStateListener?.onBluetoothPrinterFound(discoveredPrinter.address)
            } else {
                arguments["Name"] = discoveredPrinter.discoveryDataMap["FRIENDLY_NAME"]
                arguments["IsWifi"] = false
                onBluetoothPrinterStateListener?.onBluetoothPrinterFound(discoveredPrinter.address)
            }
        })
    }

    private fun addPrinterToDiscoveryPrinterList(discoveredPrinter: DiscoveredPrinter) {
        for (dp in discoveredPrinters) {
            if (dp.address == discoveredPrinter.address) return
        }
        discoveredPrinters.add(discoveredPrinter)
    }

    /**
     * Connect to the mentioned Bluetooth Printer id.
     */
    fun connectToPrinter(
        context: Context?,
        printerAddress: String?,
        receipt: String?,
        receiptType: String?,
        isBitmap: Boolean
    ) {
        Thread {
            isZebraPrinter = true
            selectedAddress = null
            macAddress = null
            val bluetoothPrinterMacAddress = sharedPref?.getString("bluetoothPrinterMacAddress","")
            val isBluetoothPrinter: Boolean
            if (printerAddress?.contains(":") == true) {
                macAddress = printerAddress
                isBluetoothPrinter = true
            } else {
                selectedAddress = printerAddress
                isBluetoothPrinter = false
            }
            if(printerAddress == bluetoothPrinterMacAddress) {
                printer = connect(macAddress, isBluetoothPrinter)
            }
            if (printer != null) {
                printReceipt(receipt, receiptType, isBitmap, context)
            } else {
                onBluetoothPrinterStateListener?.onBluetoothPrinterError("BLUETOOTH PRINTER CONNECT FAILED")
            }
        }.start()
    }

    fun connectToBluetoothPrinter(macAddress: String?, isBluetoothPrinter: Boolean) {
        Thread {
            connect(macAddress,isBluetoothPrinter)
        }.start()
    }

     private fun connect(macAddress: String?, isBluetoothPrinter: Boolean): ZebraPrinter? {
        printerConnection = null
        printerConnection = if (isBluetoothPrinter) {
            BluetoothConnectionInsecure(macAddress)
        } else {
            try {
                TcpConnection(selectedAddress, 6101) //TcpAddress, TcpPort
            } catch (e: java.lang.NumberFormatException) {
                return null
            }
        }
        try {
            printerConnection?.open()
        } catch (e: ConnectionException) {
            Sleeper.sleep(300)
            disconnect()
            return null
        }
        var printer: ZebraPrinter? = null
        if (printerConnection?.isConnected == true) {
            try {
                printer = ZebraPrinterFactory.getInstance(PrinterLanguage.CPCL, printerConnection)
            } catch (e: ConnectionException) {
                printer = null
                Sleeper.sleep(300)
                disconnect()
            }
        }
        return printer
    }

    fun disconnect() {
        countDiscovery = 0
        countEndScan = 0
        discoveredPrinters.clear()
        sendDiscoveredPrinters.clear()
        if (isZebraPrinter) {
            try {
                if (printerConnection != null) {
                    printerConnection?.close()
                }
            } catch (e: ConnectionException) {
                e.printStackTrace()
            } finally {
            }
        } else {
            socketManager?.close()
        }
    }

    fun saveRegisteredPrinter(bluetoothPrinterMacAddress: String?) {
        if (bluetoothPrinterMacAddress != null) {
            val sharedPrefEdit = sharedPref?.edit()
            sharedPrefEdit?.putString("bluetoothPrinterMacAddress", bluetoothPrinterMacAddress)
            sharedPrefEdit?.apply()
            }
        }
    }