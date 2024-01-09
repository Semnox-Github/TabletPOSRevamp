package com.semnox.semnox_tablet_pos.utils

object Sleeper {
    fun sleep(ms: Int) {
        try {
            Thread.sleep(ms.toLong())
        } catch (e: InterruptedException) {
            e.printStackTrace()
        }
    }
}