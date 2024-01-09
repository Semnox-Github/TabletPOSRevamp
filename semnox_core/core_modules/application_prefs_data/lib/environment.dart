
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if(kReleaseMode) {
      return 'production.env';
    } else {
      return 'development.env';
    }
  }

  static String get baseUrl {
    return dotenv.env['BASE_URL']!;
  }

  static String get systemUserName {
    return dotenv.env['SYSTEM_USER_USERNAME']!;
  }

  static String get systemUserPassword {
    return dotenv.env['SYSTEM_USER_PASSWORD']!;
  }
}