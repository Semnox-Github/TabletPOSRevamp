library nfc;

import 'dart:async';
import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';

class NFCManager {
  StreamController<NFCReadData> _streamController = StreamController<NFCReadData>.broadcast();

  ///
  ///Use [dataStream] to Read Data
  ///
  Stream<NFCReadData> get dataStream => _streamController.stream;
  NFCReadData? _value;

  ///
  ///Use to get Data
  ///
  NFCReadData? get value => _value;

  ///
  /// Check NFC availability
  ///
  Future<bool> isNfcAvailable() async  {
    return await NfcManager.instance.isAvailable();
  }

  ///
  ///Start Listening for Card Tap.
  ///
  ///
  Stream<NFCReadData> startScan() {
    NfcManager.instance.startSession(
      onDiscovered: (tag) async {
        var nfcReadData = NFCReadData(
            handle: tag.handle,
            data: tag.data,
            readableData: _toReadable(tag.data['nfca']['identifier']));
        _value = nfcReadData;
        _streamController.add(nfcReadData);
      },
    );

    return dataStream;
  }

  ///
  ///
  ///Stop Listening for Card Tap.
  ///
  void stop() {
    NfcManager.instance.stopSession();
  }

  String _toReadable(Uint8List? buffer, {Radix radix = Radix.hex}) {
    if (buffer == null || buffer.isEmpty) return '';

    final List<String> list = [];
    for (int data in buffer) {
      var str = data.toRadixString(radix == Radix.hex ? 16 : 10).padLeft(2, '0');
      if (radix == Radix.hex) str = (str.toUpperCase());
      list.add(str);
    }
    final result = list.join('');
    return result;
  }
}

class NFCReadData {
  String handle;
  Map<String, dynamic> data;
  String readableData;

  NFCReadData({
    required this.handle,
    required this.data,
    required this.readableData,
  });
}

enum Radix {
  hex,
  dec,
}
