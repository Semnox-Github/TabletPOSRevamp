package com.semnox.semnox_tablet_pos.sunmi_printer

import android.app.Activity
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothSocket
import android.graphics.Bitmap
import com.semnox.semnox_tablet_pos.bluetooth_printer.BluetoothPrinter
import com.semnox.semnox_tablet_pos.utils.Sleeper

class SunmiPrinter(activity: Activity, listener: OnStateListener) {

    var onStateListener: OnStateListener? = null
    private var activity: Activity? = null

    init {
        this.activity = activity
        this.onStateListener = listener
    }
    interface OnStateListener {
        fun onSunmiPrinterError(error: String, data : String )
        fun onSunmiPrintingSuccess()
    }

    fun connectAndPrintBitmap(bitmapToPrint: Bitmap?, receiptType : String?) {
        val btAdapter = BluetoothUtil.getBTAdapter()
        if (btAdapter == null) {
            onStateListener?.onSunmiPrinterError("SUNMI BLUETOOTH FAILED", "Please Open Bluetooth!")
            return
        }
        val device = BluetoothUtil.getDevice(btAdapter)
        if (device == null) {
            onStateListener?.onSunmiPrinterError("SUNMI BLUETOOTH FAILED", "Please Make Sure Bluetooth have InterPrinter!")
            return
        }

        var socket: BluetoothSocket? = null
        try {
            socket = BluetoothUtil.getSocket(device)
        } catch (bluetoothUtilException: java.lang.Exception) {
            onStateListener?.onSunmiPrinterError("SUNMI PRINTER FAILED", bluetoothUtilException.message.toString())
        }

        try {
            BluetoothUtil.sendData(ESCUtil.printBitmap(bitmapToPrint), socket)
            Sleeper.sleep(1500)
            onStateListener?.onSunmiPrintingSuccess()
        } catch (bluetoothUtilException: java.lang.Exception) {
            onStateListener?.onSunmiPrinterError("SUNMI PRINTER FAILED", bluetoothUtilException.message.toString())
        }
    }

    fun connectAndPrintString(stringToPrint: String?, receiptType : String?) {
        val btAdapter = BluetoothUtil.getBTAdapter()
        if (btAdapter == null) {
            onStateListener?.onSunmiPrinterError("SUNMI BLUETOOTH FAILED", "Please Open Bluetooth!")
            return
        }

        val device: BluetoothDevice? = BluetoothUtil.getDevice(btAdapter)
        if (device == null) {
            onStateListener?.onSunmiPrinterError("SUNMI BLUETOOTH FAILED", "Please Make Sure Bluetooth have InterPrinter!")
            return
        }

        var socket: BluetoothSocket? = null
        try {
            socket = BluetoothUtil.getSocket(device)
        } catch (bluetoothUtilException: java.lang.Exception) {
            onStateListener?.onSunmiPrinterError("SUNMI PRINTER FAILED", bluetoothUtilException.message.toString())
        }

        try {
            BluetoothUtil.sendData(stringToPrint!!.toByteArray(), socket)
            Sleeper.sleep(1500)
            onStateListener?.onSunmiPrintingSuccess()
        } catch (bluetoothUtilException: java.lang.Exception) {
            onStateListener?.onSunmiPrinterError("SUNMI PRINTER FAILED", bluetoothUtilException.message.toString())
        }
    }
}