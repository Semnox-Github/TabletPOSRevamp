import 'dart:convert';
import 'dart:io';

import 'package:application_prefs_data/builder.dart';
import 'package:logger/logger.dart';
import 'package:logs_data/DeviceDetails.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:execution_context/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logs_data/constants.dart';

import 'logger.dart';

class FileStorage{
  String _logData = "";
  Map<String,dynamic>? _deviceInfo ;
  var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var format = DateFormat('yyyy-MM-dd');
  Directory? directory;
  String _currentPath = "";
  String _pathSize = "";
  SemnoxLogLevel _level = SemnoxLogLevel.all;
  String? userName;
  String? posName;
  bool _isLoggingEnabled = true;

  static const double KB = 1024 ;
  static const double MB = 1024 * 1024;
  static const double maxMB = 10.00;
  static const String _userName = "ParafaitPOS";

  var deviceDetails = DeviceDetails();

  Future<String> get _localPath async {
    Directory dir;
    if(Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      var directory = await getExternalStorageDirectory();
      directory ??= await getApplicationDocumentsDirectory();
      dir = directory;
    }
    directory = await Directory('${dir.path}/logs').create(recursive: true);
    await _deviceInformation;
    return directory!.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    var file = await _getFileName('$path/');
    _currentPath = file.toString().split('/').last;
    if(await _checkFileExist(file)){
      _deviceInfo = null;
      _getFileSize(file);
    }else{
      _getLogSize();
    }
    return file;
  }

  Future<void> writeLogs(Level level,String data) async {
    if(_isLoggingEnabled) {
      _logData = data;
      // _level = level;
      final file = await _localFile;
      // Write the file
      await file.writeAsString("${_deviceInfo?.toString() ?? ''} \n$data", mode: FileMode.append);
    }
  }

  Future<void> writeLog(SemnoxLogLevel level, String data, {String? screenName, String? buttonName}) async {
    if(_isLoggingEnabled) {
      _logData = data;
      _level = level;
      double dataLength = calculateMegabytes(data);
      if(dataLength > maxMB) {
        ///ignore writing data that is greater than 10 mb for single write.
        return;
      }
      final file = await _localFile;
      // Write the file
      if(screenName != null) {
        await file.writeAsString("${_deviceInfo?.toString() ?? ''} \n${DateTime.now().toLocal()} ->${' ${screenName.toUpperCase() ?? ''} -> '}${' ${buttonName?.toUpperCase() ?? ''} -> '} ${level.name.toUpperCase()} -> $data", mode: FileMode.append, flush: true);
      } else {
        await file.writeAsString("${_deviceInfo?.toString() ?? ''} \n${DateTime.now().toLocal()} -> ${level.name.toUpperCase()} -> $data", mode: FileMode.append, flush: true);
      }
    }
  }

  Future<String> readLogs() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return (contents);
    } catch (e) {
      // If encountering an error, return empty
      return "";
    }
  }

  deleteFile() async {
    try {
      final file = await _localFile;
      await file.delete();
    } catch (e) {
      return "";
    }
  }

  double calculateMegabytes(String text) {
    int bytes = utf8.encode(text).length;
    double megabytes = bytes / (1024 * 1024);
    return megabytes;
  }

  double _getFileSize(File file)  {
    int sizeInBytes = file.lengthSync();
    double sizeInKB = sizeInBytes / 1000;
    double sizeInMb = sizeInKB / 1000;
    _pathSize = (sizeInKB).toStringAsFixed(3) ;
    return sizeInMb;
  }

  double _getLogSize(){
    List<int> bytes = utf8.encode(_logData);
    int sizeInBytes = bytes.length;
    double sizeInKB = sizeInBytes / 1000;
    double sizeInMb =  sizeInKB / 1000;
    _pathSize = (sizeInKB).toStringAsFixed(3);
    return sizeInMb;
  }

  Future<bool> _checkFileExist(File file) async {
    return await file.exists() ? true : false;
  }

  double _checkTotalSize(File file){
    return (_getFileSize(file) + _getLogSize());
  }

  Future<File?> _checkFileList(String path) async {
    DateTime? lastModified;
    List contents = directory!.listSync();
    File? latestFile;
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        final fileName = fileOrDir.path.split(Platform.pathSeparator).last.toString();
        if(fileName.contains(userName ?? _userName) && fileName.contains(currentDate) ) {
          var modifiedTime = fileOrDir.lastModifiedSync();
          if(lastModified == null || modifiedTime.isAfter(lastModified)) {
            lastModified = modifiedTime;
            latestFile = fileOrDir;
          }
        }
      }
    }
    return latestFile;
  }

  Future<File?> deleteFileList() async {
    final file = await _localPath;
    List contents = directory!.listSync();
    var oldDate = DateTime.now().subtract(const Duration(days: 5));
    File? latestFile;
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        final dateString = fileOrDir.path.split(Platform.pathSeparator).last.toString().split('-').sublist(0,3).join('-');
        final fileDate = DateTime.parse(dateString);
        if(fileDate.compareTo(oldDate) < 0) {
          fileOrDir.deleteSync();
        }
      }
    }
    return latestFile;
  }

  Future<File> _getFileName(String path) async {
    var lastFile = await _checkFileList(path);
    var appPrefsBL = await ApplicationPrefsBuilder.build();
    var machineName = posName;
    if(machineName == null || machineName.isEmpty == true) {
      machineName = appPrefsBL.getMachineName() ?? '';
    }
    var siteName = appPrefsBL.getDefaultSiteName();
    File file ;
    if(lastFile != null && _checkTotalSize(lastFile) < maxMB) {
      file = lastFile;
    } else {
      final uuid = generateUniqueId();
      File('$path${format.format(DateTime.now())}-$uuid-${siteName ?? ''}-$machineName-${userName ?? _userName}.txt').createSync();
      file = File('$path${format.format(DateTime.now())}-$uuid-${siteName ?? ''}-$machineName-${userName ?? _userName}.txt');
    }
    return file;
  }


  Future<Map<String, dynamic>?> get _deviceInformation async {
    _deviceInfo = await deviceDetails.deviceInfo;
    return _deviceInfo;
  }

  String generateUniqueId() {
    var now = DateTime.now();
    var uniqueId = '${now.millisecondsSinceEpoch}';
    return uniqueId;
  }

  Future<String> get localFileName async {
    final path = await _localPath;
    var file = await _getFileName('$path/');
    _currentPath =(file.toString().split('/').last);
    if(await _checkFileExist(file)) {
      _getFileSize(file);
    }
    return ('$path/$_currentPath');
  }

  Future<void> getUserInfo() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    userName = execContextDTO?.userId;
    posName = execContextDTO?.posMachineName;
  }

  Future<void> initLoggingStatus() async {
    final preferences = await SharedPreferences.getInstance();
    _isLoggingEnabled = preferences.getBool(isLoggingEnabled) ?? false;
  }

  void checkAndSetLoggingStatus(bool status) {
    _isLoggingEnabled = status;
  }
}

