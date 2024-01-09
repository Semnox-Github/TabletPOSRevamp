import 'nfc.dart';
import 'package:logs_data/logger.dart';

class NfcSample{
  void sample(){
    NFCManager nfcManager = NFCManager();
    Stream<NFCReadData> nfcReadDataStream =  nfcManager.startScan();
    nfcReadDataStream.listen((data) {
      Log.v("Nfc Data : ${data.readableData}");
      nfcManager.stop();
    });
  }
}