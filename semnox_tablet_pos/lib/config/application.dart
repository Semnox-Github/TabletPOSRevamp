import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:master_data/models/active_printers_container/active_printers_data.dart';

class Application {
  static final Application _instance = Application._internal();
  Application._internal();

  factory Application() {
    return _instance;
  }

  static Application get instance => _instance;

  static final navKey = GlobalKey<NavigatorState>();
  static final sessionStateStream = StreamController<SessionState>();

  /// Variables related to Bluetooth Printer
  static List<ActivePrintersData>? activePrinters;
  static bool? isBluetoothPrinterConnectionDone;
  static bool? isBluetoothAvailable;
  static bool? isBluetoothSupported;
  static bool? isBluetoothPermissionGranted;
  static String? printerType;
  static String? deviceManufacturer;
}