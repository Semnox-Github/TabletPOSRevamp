package com.semnox.semnox_tablet_pos.sunmi_barcode_reader;

public class BarcodeReader
{
    public interface OnBarcodeReadListener
    {
        void onBarcodeRead(String barcode);
        void onBarcodeReadFailed(String failureMessage);
    }
    
    protected Boolean barcodeReadStatus;
    
    public void startBarcodeReader()  throws BarcodeReaderException
    {
    }
    
    public void stopBarcodeReader() throws BarcodeReaderException
    {
    }
    
    public void releaseBarcodeReader() throws BarcodeReaderException
    {
    }
    
    public boolean getBarcodeReaderStatus()
    {
        return barcodeReadStatus;
    }

    public String trimLeadingAndTrailingSpacesOfScannedData(String barcodeNumber){
        return barcodeNumber.trim();
    }

    public static class BarcodeReaderException extends Exception
    {
        private static final long serialVersionUID = 1L;
        public BarcodeReaderException()
        {
        }
        public BarcodeReaderException(String excepMessage)
        {
            super(excepMessage);
        }
    }
}
