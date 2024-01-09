package com.semnox.semnox_tablet_pos.utils

import java.io.BufferedReader
import java.io.IOException
import java.io.OutputStream
import java.net.InetSocketAddress
import java.net.Socket

class ConnectionSocketManager {
    private var mMyWifiSocket: Socket? = null
    private var bufferReader: BufferedReader? = null
    private var outputStream: OutputStream? = null
    var istate = false
        private set
    private var mstrIp = "192.168.1.248"
    private var mPort = 9100
    private var TimeOut = 1300
    fun threadconnect() {
        ConnectThread()
    }

    fun threadconnectwrite(str: ByteArray?) {
        WriteThread(str)
    }

    fun connect(): Boolean {
        close()
        return try {
            mMyWifiSocket = Socket()
            mMyWifiSocket!!.connect(InetSocketAddress(mstrIp, mPort), TimeOut)
            outputStream = mMyWifiSocket!!.getOutputStream()
            true
        } catch (e: IOException) {
            e.printStackTrace()
            SetState(MESSAGE_CONNECTED_ERROR)
            false
        }
    }

    fun write(out: ByteArray?): Boolean {
        return if (outputStream != null) {
            try {
                outputStream!!.write(out)
                outputStream!!.flush()
                true
            } catch (e: IOException) {
                e.printStackTrace()
                false
            }
        } else {
            false
        }
    }

    fun close() {
        if (mMyWifiSocket != null) {
            try {
                mMyWifiSocket!!.close()
                mMyWifiSocket = null
            } catch (e1: IOException) {
                e1.printStackTrace()
            }
        }
        if (bufferReader != null) {
            try {
                bufferReader!!.close()
                bufferReader = null
            } catch (e2: IOException) {
                e2.printStackTrace()
            }
        }
        if (outputStream != null) {
            try {
                outputStream!!.close()
            } catch (e: IOException) {
                e.printStackTrace()
            }
            outputStream = null
        }
    }

    fun ConnectAndWrite(out: ByteArray?): Boolean {
        return if (connect()) {
            write(out)
            close()
            SetState(MESSAGE_WRITE_SUCCESS)
            true
        } else {
            SetState(MESSAGE_CONNECTED_ERROR)
            false
        }
    }

    fun SetState(state: Boolean) {
        istate = state
    }

    private inner class ConnectThread : Thread() {
        init {
            start()
        }

        override fun run() {
            if (connect()) {
                SetState(MESSAGE_CONNECTED)
            }
            close()
        }
    }

    private inner class WriteThread(var out: ByteArray?) : Thread() {
        init {
            start()
        }

        override fun run() {
            if (ConnectAndWrite(out)) {
                SetState(MESSAGE_WRITE_SUCCESS)
            }
        }
    }

    companion object {
        const val MESSAGE_CONNECTED = true
        const val MESSAGE_CONNECTED_ERROR = false
        const val MESSAGE_WRITE_SUCCESS = true
        const val MESSAGE_WRITE_ERROR = false
    }
}