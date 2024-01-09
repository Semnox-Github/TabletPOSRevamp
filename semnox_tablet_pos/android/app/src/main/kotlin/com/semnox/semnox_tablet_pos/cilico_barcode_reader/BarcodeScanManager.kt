package com.semnox.semnox_tablet_pos.cilico_barcode_reader

import IScanServer
import android.app.Service
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import android.os.RemoteException

class BarcodeScanManager(mContext: Context) {
    private var iScanServerService: IScanServer? = null

    private var serviceConnection: ServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            iScanServerService = IScanServer.Stub.asInterface(service)
        }

        override fun onServiceDisconnected(name: ComponentName) {}
    }

    init {
        val i = Intent("com.olc.scan.ScanServer")
        i.setPackage("com.olc.scan")
        mContext.bindService(i, serviceConnection, Service.BIND_AUTO_CREATE)
    }

    fun startRead() {
        if (iScanServerService != null) {
            try {
                iScanServerService?.startRead()
            } catch (e: RemoteException) {
                e.printStackTrace()
            }
        }
    }

    fun stopRead() {
        if (iScanServerService != null) {
            try {
                iScanServerService?.stopRead()
            } catch (e: RemoteException) {
                e.printStackTrace()
            }
        }
    }

    fun closeReader() {
        if (iScanServerService != null) {
            try {
                iScanServerService?.closeReader()
            } catch (e: RemoteException) {
                e.printStackTrace()
            }
        }
    }

    var scanSwitchLeft: Boolean?
        get() {
            if (iScanServerService != null) {
                try {
                    return iScanServerService?.scanSwitchLeft
                } catch (e: RemoteException) {
                    e.printStackTrace()
                }
            }
            return false
        }
        set(flag) {
            if (iScanServerService != null) {
                try {
                    if (flag != null) {
                        iScanServerService?.scanSwitchLeft = flag
                    }
                } catch (e: RemoteException) {
                    e.printStackTrace()
                }
            }
        }

    var scanSwitchRight: Boolean?
        get() {
            if (iScanServerService != null) {
                try {
                    return iScanServerService?.scanSwitchRight
                } catch (e: RemoteException) {
                    e.printStackTrace()
                }
            }
            return false
        }
        set(flag) {
            if (iScanServerService != null) {
                try {
                    iScanServerService?.scanSwitchRight = flag == true
                } catch (e: RemoteException) {
                    e.printStackTrace()
                }
            }
        }

    var barcodeReceiveModel: Int?
        get() {
            if (iScanServerService != null) {
                try {
                    return iScanServerService?.barcodeReceiveModel
                } catch (e: RemoteException) {
                    e.printStackTrace()
                }
            }
            return -1
        }
        set(state) {
            if (iScanServerService != null) {
                try {
                    if (state != null) {
                        iScanServerService?.barcodeReceiveModel = state
                    }
                } catch (e: RemoteException) {
                    e.printStackTrace()
                }
            }
        }

    companion object {
        private var instance: BarcodeScanManager? = null

        fun getInstance(context: Context?): BarcodeScanManager? {
            if (instance == null) {
                instance = context?.let { BarcodeScanManager(it) }
            }
            return instance
        }
    }
}