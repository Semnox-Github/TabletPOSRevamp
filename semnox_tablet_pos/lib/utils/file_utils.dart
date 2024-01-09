
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class FileUtils {
  const FileUtils();

  Future<String> writeToFile(String text) async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
      directory ??= await getApplicationDocumentsDirectory();
    }
    final timeStamp = DateTime.now();
    final File file = File('${directory.path}/error_log_${timeStamp.toString()}.txt');
    await file.writeAsString(text);
    return '${directory.path}/error_log_${timeStamp.toString()}.txt';
  }

  Future<void> shareFile(path) async {
    File sharedFile = File(path);
    if (!await sharedFile.exists()) {
      return;
    }
   await ShareExtend.share(sharedFile.path, "file");
  }
}

const FileUtils fileUtils = FileUtils();
