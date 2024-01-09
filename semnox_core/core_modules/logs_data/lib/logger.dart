import 'dart:async';

import 'package:logger/logger.dart';
import 'package:logs_data/FileStorage.dart';
import 'package:logs_data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Log = SemnoxLogger();

class SemnoxLogger {

  static final SemnoxLogger _instance = SemnoxLogger._internal();
  SemnoxLogger._internal();
  SharedPreferences? preferences;
  late AsyncMutex mutex;

  factory SemnoxLogger() {
    Future.microtask(() async {
      await fileStorage.getUserInfo();
      _instance.preferences = await SharedPreferences.getInstance();
    });
    _instance.mutex = AsyncMutex();
    return _instance;
  }
  
  void printLog(String text, [SemnoxLogLevel level = SemnoxLogLevel.all, String? screenName, String? buttonName]) {
    fileStorage.getUserInfo();
    fileStorage.checkAndSetLoggingStatus(preferences?.getBool(isLoggingEnabled) ?? false);
    mutex.run(() => fileStorage.writeLog(level, text, screenName: screenName, buttonName: buttonName));
  }

  void printMethodCalls(String text, [MethodEvents event = MethodEvents.start, String? screenName, String? buttonName]) {
    printLog("${event.name.toUpperCase()} -> $text", SemnoxLogLevel.methodCall, screenName, buttonName);
  }

  void printMethodStart(String text, String screenName, String buttonName) {
    printMethodCalls(text, MethodEvents.start, screenName, buttonName);
  }

  void printMethodEnd(String text, String screenName, String buttonName) {
    printMethodCalls(text, MethodEvents.end, screenName, buttonName);
  }

  void printMethodReturn(String text, String screenName, String buttonName) {
    printMethodCalls(text, MethodEvents.Return, screenName, buttonName);
  }

  void printApiLog(String text) {
    printLog(text, SemnoxLogLevel.api);
  }

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    printLog(message.toString(), SemnoxLogLevel.all);
  }

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    printLog(message.toString(), SemnoxLogLevel.all);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    printLog(message.toString(), SemnoxLogLevel.all);
  }

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    printLog(message.toString(), SemnoxLogLevel.all);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    printLog(message.toString(), SemnoxLogLevel.error);
  }

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    printLog(message.toString(), SemnoxLogLevel.all);
  }

}

enum SemnoxLogLevel {
  api, methodCall, error, all
}

enum MethodEvents {
  start, end, Return
}

final fileStorage = FileStorage();

class CustomPrinter extends LogPrinter{

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    final exception = event.error;
    final level = event.level;

    fileStorage.getUserInfo();
    fileStorage.initLoggingStatus();
    fileStorage.writeLogs(level,message);
    return [color!('$emoji $level: $message')];
  }

}

class CustomFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class AsyncMutex {
  Future _next = Future.value(null);
  /// Request [operation] to be run exclusively.
  ///
  /// Waits for all previously requested operations to complete,
  /// then runs the operation and completes the returned future with the
  /// result.
  Future<T> run<T>(Future<T> Function() operation) {
    var completer = Completer<T>();
    _next.whenComplete(() {
      completer.complete(Future<T>.sync(operation));
    });
    return _next = completer.future;
  }
}