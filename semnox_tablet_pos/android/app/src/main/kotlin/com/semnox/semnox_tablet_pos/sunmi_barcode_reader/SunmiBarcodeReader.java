package com.semnox.semnox_tablet_pos.sunmi_barcode_reader;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

public class SunmiBarcodeReader extends BarcodeReader {

    Activity activity;
    public static final String BARCODE_ACTION = "com.sunmi.scanner.ACTION_DATA_CODE_RECEIVED";
    private static final String BARCODE_PARAM = "data";
    private final OnBarcodeReadListener barcodeReadListener;
    public SunmiBarcodeReader(Activity activity, OnBarcodeReadListener listener){
        this.activity = activity;
        this.barcodeReadStatus = false;
        this.barcodeReadListener = listener;
    }

    @Override
    public void startBarcodeReader() throws BarcodeReaderException
    {
        if (barcodeReadStatus)
            return;

        registerBarcodeReceiver();
        barcodeReadStatus = true;
    }

    @Override
    public void stopBarcodeReader() throws BarcodeReaderException
    {
        if (!barcodeReadStatus)
            return;

        unRegisterBarcodeReceiver();
        barcodeReadStatus = false;
    }

    @Override
    public void releaseBarcodeReader() throws BarcodeReaderException
    {

    }

    public final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, final Intent intent) {

            String action = intent.getAction();
            if (BARCODE_ACTION.equals(action))
            {
                String readBarcode = intent.getStringExtra(BARCODE_PARAM);
                String trimmedBarcodeNumber = trimLeadingAndTrailingSpacesOfScannedData(readBarcode);
                barcodeReadListener.onBarcodeRead(trimmedBarcodeNumber);
            }
            
        }
    };

    public void registerBarcodeReceiver(){
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(BARCODE_ACTION);
        activity.registerReceiver(receiver, intentFilter);
    }

    public void unRegisterBarcodeReceiver(){
        activity.unregisterReceiver(receiver);
    }

}
