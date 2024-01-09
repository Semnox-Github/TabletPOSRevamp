import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_response.dart';

void main() {
  String getFileContent(String fileName) => File('test/$fileName').readAsStringSync();

  test('parse json success', () async {

    var input = getFileContent('response.json'); // add files inside test folder.
    var response = json.decode(input);

    try {
      var model = FacilityTableCurrentStatusResponse.fromJson(response);
      print('RESP is ${model.toString()}');
    } on DioError catch (e) {
      print('error: ${e.toString()}');
    }

  });
}
