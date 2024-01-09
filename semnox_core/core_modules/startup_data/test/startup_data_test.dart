import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:startup_data/models/generic/generic_response.dart';
import 'package:startup_data/models/key_management/key_management_item.dart';


void main() {
  String getFileContent(String fileName) => File('test/$fileName').readAsStringSync();

  test('parse json success', () async {

    var input = getFileContent('response.json'); // add files inside test folder.
    var response = json.decode(input);

    try {
      var model =  GenericResponse.fromJson(response);
      var list = model.data as List;
      var test = KeyManagementItem.fromJson(list[0]);
      print('ITEM ${test.toString()}');
    } on DioError catch (e) {
      print('Error: ${e.toString()} ');
    }

  });

}
