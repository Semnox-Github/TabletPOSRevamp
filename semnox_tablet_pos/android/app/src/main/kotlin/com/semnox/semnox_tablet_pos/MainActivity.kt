package com.semnox.semnox_tablet_pos

import android.Manifest
import android.annotation.SuppressLint
import android.app.AlertDialog
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.graphics.BitmapFactory
import android.util.Base64
import android.location.LocationManager
import android.os.Build
import android.util.Log
import androidx.core.app.ActivityCompat
import com.semnox.kioskmode.KioskUtility
import com.semnox.semnox_tablet_pos.bluetooth_printer.BluetoothPrinter
import com.semnox.semnox_tablet_pos.cilico_barcode_reader.BarcodeScanManager
import com.semnox.semnox_tablet_pos.sunmi_barcode_reader.BarcodeReader
import com.semnox.semnox_tablet_pos.sunmi_barcode_reader.SunmiBarcodeReader
import com.semnox.semnox_tablet_pos.sunmi_printer.SunmiPrinter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File

class MainActivity : FlutterActivity(), BarcodeReader.OnBarcodeReadListener,
    BluetoothPrinter.OnBluetoothPrinterStateListener, SunmiPrinter.OnStateListener {

    /**
     * Global Method Channel
     */
    private val deviceChannel = "semnox.tablet.pos/device"
    private lateinit var deviceMethodChannel: MethodChannel

    /**
     * Kiosk Mode
     */
    private val kioskModeChannel = "semnox.tablet.pos/kiosk_mode_channel"
    private lateinit var kioskModeMethodChannel: MethodChannel

    /**
     * Barcode Scanning
     */
    private val barcodeScannerChannel = "semnox.tablet.pos/barcode_scanning"
    private lateinit var barcodeScannerMethodChannel: MethodChannel
    private var scanManager : BarcodeScanManager? = null

    /**
     * Printing
     */
    private val printingChannel = "semnox.tablet.pos/printing"
    private lateinit var printingMethodChannel: MethodChannel

    private val REQUEST_LOCATION = 99
    private val REQUEST_ENABLE_BT = 10
    private val REQUEST_BLUETOOTH = 98

    private var bluetoothPrinter : BluetoothPrinter ?= null
    private var sunmiPrinter : SunmiPrinter? = null
    private var receipt : String? = null
    private var receiptType : String? = null
    private var isBitmap : Boolean = false
    private var isZebraPrintingTaskInProgress : Boolean = false
    private var isSunmiPrintingTaskInProgress : Boolean = false
    private var isPrintingTaskInProgress : Boolean = false
    private val context: Context? = null
    private lateinit var sunmiBarcodeReader: SunmiBarcodeReader

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        bluetoothPrinter = BluetoothPrinter(activity, this)
        sunmiPrinter = SunmiPrinter(activity, this)

        /**
         * MethodChannel
         */
        deviceMethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, deviceChannel)
        deviceMethodChannel.setMethodCallHandler { call, _ ->
            if (call.method == "getDeviceManufacturer") {
                deviceMethodChannel.invokeMethod("DEVICE MANUFACTURER", Build.MANUFACTURER.toString())
            } else if (call.method == "requestBluetoothAndLocationPermission") {
                isBluetoothAndLocationPermissionGranted()
            } else if (call.method == "isBluetoothSupported") {
                val isBluetoothSupported = isBluetoothSupported()
                deviceMethodChannel.invokeMethod("BLUETOOTH SUPPORT", isBluetoothSupported)
            }
        }

        /**
         * MethodChannel for Kiosk Mode
         */
        kioskModeMethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, kioskModeChannel)
        kioskModeMethodChannel.setMethodCallHandler { call, result ->
            if (call.method == "startKioskMode") {
                KioskUtility.enterKioskMode(activity = this)
            } else if (call.method == "stopKioskMode") {
                KioskUtility.exitKioskMode(activity = this)
            }
        }

        /**
         * MethodChannel for Barcode Reading
         */
        barcodeScannerMethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, barcodeScannerChannel)
        barcodeScannerMethodChannel.setMethodCallHandler { call, _ ->
            sunmiBarcodeReader = SunmiBarcodeReader(activity, this)
            when (call.method) {
                "registerBarcodeReaderBroadcast" -> {
                    if (call.argument<String>("type") == "SUNMI") {
                        sunmiBarcodeReader.registerBarcodeReceiver()
                    } else if (call.argument<String>("type") == "PDA") {
                        registerBarcodeReaderBroadcast(this)
                    } else if (call.argument<String>("type") == "ZEBRA") {

                    }
                }

                "unregisterBarcodeScannerBroadcast" -> {
                    if (call.argument<String>("type") == "SUNMI") {
                        sunmiBarcodeReader.unRegisterBarcodeReceiver()
                    } else if (call.argument<String>("type") == "PDA") {
                        unregisterBarcodeScannerBroadcast(this)
                    } else if (call.argument<String>("type") == "ZEBRA") {

                    }
                }
            }
        }

        printingMethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, printingChannel)
        printingMethodChannel.setMethodCallHandler { call, _ ->
            when (call.method) {
                "printReceipt" -> {
                    receipt = call.argument("receipt")
                    if (call.argument<String>("type") == "ZEBRA") {
                        isZebraPrintingTaskInProgress = true
                        isPrintingTaskInProgress = true
                        receipt = call.argument("receipt")
                        receiptType = call.argument("receiptType")
                        isBitmap = call.argument<Boolean>("isBitmap") == true
                        if(isBluetoothSupported()) {
                            isBluetoothPermissionGranted()
                        } else {
                            handlePrintingCallback(context, "BLUETOOTH NOT SUPPORTED", "")
                        }
                    } else if (call.argument<String>("type") == "SUNMI") {
                        isSunmiPrintingTaskInProgress = true
                        if (call.argument<Boolean>("isBitmap") == true) {
                            val decodedString: ByteArray = Base64.decode(call.argument<String>("receipt"), Base64.DEFAULT)
                            val decodedReceiptBitMap = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.size)
                            sunmiPrinter?.connectAndPrintBitmap(decodedReceiptBitMap, call.argument("receiptType"))
                        } else {
                            sunmiPrinter?.connectAndPrintString(call.argument("receipt"), call.argument("receiptType"))
                        }
                    }
                }
                "connectToBluetoothPrinter" -> {
                    if (call.argument<String>("type") == "ZEBRA") {
                        isZebraPrintingTaskInProgress = true
                        isPrintingTaskInProgress = true
                        receipt = call.argument("receipt")
                        receiptType = call.argument("receiptType")
                        isBitmap = call.argument<Boolean>("isBitmap") == true
                        bluetoothPrinter?.connectToPrinter(
                            context,
                            call.argument("printerAddress"),
                            receipt,
                            receiptType,
                            isBitmap
                        )
                    }
                }
                "disconnect" -> {
                    bluetoothPrinter?.disconnect()
                }
                "saveRegisteredPrinter" -> {
                    bluetoothPrinter?.saveRegisteredPrinter(
                            call.argument("bluetoothPrinterMacAddress")
                    )
                }
                "connectToPrinter" -> {
                    var isBluetoothPrinter = false
                    val printerMacAddress: String? = call.argument<String>("bluetoothPrinterMacAddress")
                    if (printerMacAddress?.contains(":") == true) {
                        isBluetoothPrinter = true
                    }
                    bluetoothPrinter?.connectToBluetoothPrinter(
                            call.argument("bluetoothPrinterMacAddress"),
                            isBluetoothPrinter
                    )
                }
            }
        }
    }

    /**
     * Permission result.
     */
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when (requestCode) {
            REQUEST_LOCATION -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    if(isZebraPrintingTaskInProgress) {
                        isBluetoothAndLocationProviderOn()
                    } else if (isSunmiPrintingTaskInProgress) {

                    }
                } else {
                    handlePrintingCallback(context, "LOCATION PERMISSION DENIED", "")
                }
                return
            }
            REQUEST_BLUETOOTH -> {
                if(grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    isLocationPermissionGranted()
                } else {
                    handlePrintingCallback(context, "BLUETOOTH PERMISSION DENIED", "")
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            REQUEST_ENABLE_BT -> {
                if(resultCode == RESULT_OK) {
                    isLocationNetworkProviderIsOn()
                } else {
                    handlePrintingCallback(this, "BLUETOOTH TURNED OFF", "")
                }
            }
        }
    }

    /**
     * Cilico Device - Barcode Scanner
     * This method will register for barcode scan manager.
     */
    private fun registerBarcodeReaderBroadcast(context: Context?) {
        scanManager = BarcodeScanManager.getInstance(context)
        scanManager?.scanSwitchLeft = true
        scanManager?.scanSwitchRight = true
        scanManager?.barcodeReceiveModel = 2

        val intentFilter = IntentFilter()
        intentFilter.addAction("com.barcode.sendBroadcast")
        this.runOnUiThread {
            registerReceiver(barcodeScannerBroadCastReceiver, intentFilter)
        }
    }

    /**
     * Cilico Device - Barcode Scanner
     * This method will un-register the barcode scan manager.
     */
    private fun unregisterBarcodeScannerBroadcast(context: Context?) {
        scanManager?.stopRead()
        this.runOnUiThread {
            unregisterReceiver(barcodeScannerBroadCastReceiver)
        }
    }

    override fun onBarcodeRead(barcode: String?) {
        barcodeScannerMethodChannel.invokeMethod("SUNMI BARCODE SUCCESS", barcode ?: "")
    }

    override fun onBarcodeReadFailed(failureMessage: String?) {
        barcodeScannerMethodChannel.invokeMethod("SUNMI BARCODE FAILED", failureMessage ?: "")
    }

    /**
     * Cilico Device - Barcode Scanner
     * The broadcast receiver which listens to barcode scanning
     */
    private val barcodeScannerBroadCastReceiver: BroadcastReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val barcodeData = intent.getStringExtra("BARCODE")
            if (barcodeData != null) {
                barcodeScannerMethodChannel.invokeMethod("PDA BARCODE SUCCESS", barcodeData)
            }
        }
    }

    /**
     * Is Bluetooth supported by the device
     */
    private fun isBluetoothSupported(): Boolean {
        val bluetoothManager: BluetoothManager = getSystemService(BluetoothManager::class.java)
        val bluetoothAdapter: BluetoothAdapter? = bluetoothManager.adapter
        return bluetoothAdapter != null
    }

    /**
     * Checking if the Bluetooth Permission is granted/denied.
     */
    private fun isBluetoothAndLocationPermissionGranted() {
        /**
         * Step 1: Check if Bluetooth is supported or not.
         */
        val isBluetoothSupported = isBluetoothSupported()
        if(isBluetoothSupported) {
            isBluetoothPermissionGranted()
        }
    }

    /**
     * Checks if Bluetooth Permission is Granted/Denied
     */
    private fun isBluetoothPermissionGranted() {
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            if (ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED) {
                if(ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.BLUETOOTH_CONNECT)) {
                    AlertDialog.Builder(this)
                        .setTitle("Bluetooth Permission Needed")
                        .setMessage("This app needs the Bluetooth permission, to connect to Bluetooth Printer. Kindly please accept to use bluetooth functionality")
                        .setPositiveButton(
                            "OK"
                        ) { _, _ ->
                            requestBluetoothPermission()
                        }
                        .create()
                        .show()
                } else {
                    requestBluetoothPermission()
                }
                return
            } else {
                isLocationPermissionGranted()
            }
        } else {
            isLocationPermissionGranted()
        }
    }

    /**
     * Requesting the bluetooth permission
     */
    private fun requestBluetoothPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(
                    Manifest.permission.BLUETOOTH_CONNECT,
                    Manifest.permission.BLUETOOTH_SCAN
                ),
                REQUEST_BLUETOOTH
            )
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(
                    Manifest.permission.BLUETOOTH_ADMIN,
                    Manifest.permission.BLUETOOTH,
                ),
                REQUEST_BLUETOOTH)
        }
    }

    private fun isLocationPermissionGranted() {
        if(ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            requestLocationPermission()
        } else {
            if(isZebraPrintingTaskInProgress) {
                isBluetoothAndLocationProviderOn()
//                bluetoothPrinter?.printReceipt(receipt, receiptType,isBitmap,  this)
            } else if (isSunmiPrintingTaskInProgress) {
                //TODO
            }
        }
    }
    private fun requestLocationPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(
                    Manifest.permission.ACCESS_FINE_LOCATION,
                    Manifest.permission.ACCESS_BACKGROUND_LOCATION
                ),
                REQUEST_LOCATION
            )
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(
                    Manifest.permission.ACCESS_FINE_LOCATION,
                    Manifest.permission.ACCESS_COARSE_LOCATION),
                REQUEST_LOCATION
            )
        }
    }

    @SuppressLint("MissingPermission")
    private fun isBluetoothAndLocationProviderOn() {
        val bluetoothManager: BluetoothManager = getSystemService(BluetoothManager::class.java)
        val bluetoothAdapter: BluetoothAdapter? = bluetoothManager.adapter
        if (bluetoothAdapter?.isEnabled == false) {
            val enableBtIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
            startActivityForResult(enableBtIntent, REQUEST_ENABLE_BT)
        } else {
            isLocationNetworkProviderIsOn()
        }

        /*if (bluetoothAdapter?.isEnabled == false) {
            val enableBtIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
            if (ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED) {
                if(ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.BLUETOOTH_CONNECT)) {
                    AlertDialog.Builder(this)
                            .setTitle("Bluetooth Permission Needed")
                            .setMessage("This app needs the Bluetooth permission, to connect to Bluetooth Printer. Kindly please accept to use bluetooth functionality")
                            .setPositiveButton(
                                    "OK"
                            ) { _, _ ->
                                requestBluetoothPermission()
                            }
                            .create()
                            .show()
                } else {
                    requestBluetoothPermission()
                }
                // TODO: Consider calling
                //    ActivityCompat#requestPermissions
                // here to request the missing permissions, and then overriding
                //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                //                                          int[] grantResults)
                // to handle the case where the user grants the permission. See the documentation
                // for ActivityCompat#requestPermissions for more details.
                return
            }
            startActivityForResult(enableBtIntent, REQUEST_ENABLE_BT)
        } else {
            checkLocationPermission()
        }*/
    }

    /**
     * Checking if the location and network permission is granted before proceeding with Printer Discovery.
     */
    private fun isLocationNetworkProviderIsOn() {
        val lm = this.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        try {
            if(lm.isProviderEnabled(LocationManager.NETWORK_PROVIDER)) {
                if(isZebraPrintingTaskInProgress) {
                    bluetoothPrinter?.printReceipt(receipt, receiptType,isBitmap,  this)
                } else if (isSunmiPrintingTaskInProgress) {
                    //TODO
                }
            } else {
                handlePrintingCallback(this, "LOCATION TURNED OFF", "")
            }
        } catch (error: Exception) {
            handlePrintingCallback(this, "ERROR", error.message.toString())
        }
    }

    private fun handlePrintingCallback(context: Context?, method: String, data: String) {
        try {
            this.runOnUiThread {
                printingMethodChannel.invokeMethod(method, data)
            }
        } catch (_: Exception) {
        }
    }

    /**
     * Bluetooth Printing callbacks.
     */
    override fun onBluetoothPrinterFound(address: String) {
        try {
            this.runOnUiThread {
                printingMethodChannel.invokeMethod("PRINTER FOUND", address)
            }
        } catch (_: Exception) {
        }
    }

    override fun onBluetoothPrinterError(error: String) {
        try {
            isZebraPrintingTaskInProgress = false
            receipt = null
            receiptType = null
            isBitmap = false
            this.runOnUiThread {
                printingMethodChannel.invokeMethod("ERROR", error)
            }
        } catch (_: Exception) {
        }
    }

    override fun onBluetoothPrintingSuccess() {
        try {
            isZebraPrintingTaskInProgress = false
            receipt = null
            receiptType = null
            isBitmap = false
            this.runOnUiThread {
                printingMethodChannel.invokeMethod("PDA PRINTING SUCCESS", "")
            }
        } catch (_: Exception) {
        }
    }

    /**
     * Sunmi Printer Callbacks
     */
    override fun onSunmiPrinterError(error: String, data: String) {
        isSunmiPrintingTaskInProgress = false
        this.runOnUiThread {
            printingMethodChannel.invokeMethod(error, data)
        }
    }

    override fun onSunmiPrintingSuccess() {
        isSunmiPrintingTaskInProgress = false
        this.runOnUiThread {
            printingMethodChannel.invokeMethod("SUNMI PRINTING SUCCESS", "")
        }
    }
}
