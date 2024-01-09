package com.semnox.kioskmode

import android.app.Activity
import android.app.ActivityManager
import android.content.Context
import android.os.Build
import android.view.View
import android.view.WindowManager


object KioskUtility {

    fun enterKioskMode(activity: Activity) {
        if (!isInKioskMode(activity)) {
            activity.startLockTask()
            //Toast.makeText(activity, "Kiosk Mode - Activated", Toast.LENGTH_SHORT).show();
        }
        enterFullScreenMode(activity)
    }

    private fun enterFullScreenMode(activity: Activity) {
        // Set the IMMERSIVE flag.
        // Set the content to appear under the system bars so that the content
        // doesn't resize when the system bars hide and show.
        activity.window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION // hide nav bar
                or View.SYSTEM_UI_FLAG_FULLSCREEN // hide status bar
                or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
//        activity.requestWindowFeature(Window.FEATURE_NO_TITLE)
        activity.window.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        )
//        activity.window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
//                or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
//                or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
    }

    private fun exitFullScreenMode(activity: Activity) {
        activity.window.clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
        activity.window.addFlags(WindowManager.LayoutParams.FLAG_FORCE_NOT_FULLSCREEN)
    }

    fun exitKioskMode(activity: Activity) {
        if (isInKioskMode(activity)) {
            activity.stopLockTask()
            //Toast.makeText(activity, "Kiosk Mode - Deactivated", Toast.LENGTH_SHORT).show();
        }
        exitFullScreenMode(activity)
    }

    private fun isInKioskMode(activity: Activity): Boolean {
        val activityManager: ActivityManager = activity.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            // For SDK version 23 and above.
            return (activityManager.lockTaskModeState
                    != ActivityManager.LOCK_TASK_MODE_NONE)
        }
        return activityManager.isInLockTaskMode
    }
}