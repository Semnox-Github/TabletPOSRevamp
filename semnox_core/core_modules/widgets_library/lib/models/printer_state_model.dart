import 'package:master_data/models/active_printers_container/active_printers_data.dart';

class PrinterStateModel{

  static final PrinterStateModel _instance = PrinterStateModel._internal();
  PrinterStateModel._internal();

  factory PrinterStateModel({
    List<ActivePrintersData>? activePrinters,
    bool? isBluetoothPrinterConnectionDone,
    bool? isBluetoothAvailable,
    bool? isBluetoothSupported,
    bool? isBluetoothPermissionGranted,
    String? printerType,
    String? deviceManufacturer,
  }) {
    return _instance;
  }

  static PrinterStateModel get instance => _instance;

   List<ActivePrintersData>? activePrinters;
   bool? isBluetoothPrinterConnectionDone;
   bool? isBluetoothAvailable;
   bool? isBluetoothSupported;
   bool? isBluetoothPermissionGranted;
   String? printerType;
   String? deviceManufacturer;
}