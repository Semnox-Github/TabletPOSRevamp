
import 'dart:io';

import 'package:execution_context/builder.dart';
import 'package:logs_data/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_data/builder.dart';

class LogUtils {
  static final LogUtils _instance = LogUtils._internal();
  LogUtils._internal();

  factory LogUtils() {
    return _instance;
  }

  static LogUtils get instance => _instance;

  Directory? directory;

  Future<bool> syncLogFiles() async {
    final preferences = await SharedPreferences.getInstance();
    bool isLogsEnabled = preferences.getBool(isLoggingEnabled) ?? false;
    bool shouldUploadAllFiles = preferences.getBool(shouldUploadAllLogFiles) ?? false;
    if(isLogsEnabled) {
      if(shouldUploadAllFiles) { /// app will upload all log files at first time after app opened. Then onwards only recent file.
        preferences.setBool(shouldUploadAllLogFiles, false);
        await uploadAllLogFiles();
      } else {
        await uploadRecentLogFile(preferences);
      }
    }
    return true;
  }

  Future<void> uploadRecentLogFile(SharedPreferences preferences) async {
    await _logFilesPath;
    final contents = directory!.listSync();
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final startupDataBL = await StartupDataBuilder.build(execContextDTO!);

    File? recentFile;
    DateTime recentModifiedTime = DateTime.fromMillisecondsSinceEpoch(0);
    for (var file in contents) {
      if (file is File) {
        DateTime modifiedTime = await file.lastModified();
        if (modifiedTime.isAfter(recentModifiedTime)) {
          recentModifiedTime = modifiedTime;
          recentFile = file;
        }
      }
    }
    if(recentFile != null) {
      final lastTimeStampValue = preferences.getInt(uploadTimeStamp);
      final lastTimeStamp = lastTimeStampValue != null ? DateTime.fromMillisecondsSinceEpoch(lastTimeStampValue) : DateTime.fromMillisecondsSinceEpoch(0);
      if(recentModifiedTime.isAfter(lastTimeStamp)) { /// only upload file if it is modified since last upload.
        Log.i("Upload Logs started :: ${DateTime.now()}");
        final isCompleted = await startupDataBL.uploadLogFiles(recentFile);
        preferences.setInt(uploadTimeStamp, recentModifiedTime.millisecondsSinceEpoch);
        if(isCompleted) {
          Log.i("Upload Logs completed successfully :: ${DateTime.now()}");
        }
      }
    }
  }

  Future<void> uploadAllLogFiles() async {
    Log.i("Upload Logs started :: ${DateTime.now()}");
    await _logFilesPath;
    final contents = directory!.listSync();
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final startupDataBL = await StartupDataBuilder.build(execContextDTO!);

    bool isCompleted = false;
    await Future.forEach(contents, (element) async {
      if(element is File) {
        isCompleted = await startupDataBL.uploadLogFiles(element);
      }
    });
    if(isCompleted) {
      Log.i("Upload Logs completed successfully :: ${DateTime.now()}");
    }
  }

  Future<String> get _logFilesPath async {
    Directory dir;
    if(Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      var directory = await getExternalStorageDirectory();
      directory ??= await getApplicationDocumentsDirectory();
      dir = directory;
    }
    directory = await Directory('${dir.path}/logs').create(recursive: true);
    return directory!.path;
  }
}