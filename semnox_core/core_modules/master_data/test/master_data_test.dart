import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:master_data/master_data.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_response.dart';
import 'package:master_data/models/pos_machines_container/pos_machines_response.dart';
import 'package:master_data/models/user_role_container/user_role_container_response.dart';
import 'package:logs_data/logger.dart';

void main() {
  String getFileContent(String fileName) => File('test/$fileName').readAsStringSync();

  test('parse json success', () async {

    var input = getFileContent('response.json'); // add files inside test folder.
    var response = json.decode(input);

    try {
      var model = POSMachinesResponse.fromJson(response);
      Log.v('RESP is ${model.toString()}');
    } on DioError catch (e) {
      Log.v('error: ${e.toString()}');
    }

  });
}
