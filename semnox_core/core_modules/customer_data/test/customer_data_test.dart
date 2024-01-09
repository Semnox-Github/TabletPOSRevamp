import 'dart:convert';
import 'dart:io';

import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/account_details/link_account_details_response.dart';
import 'package:customer_data/models/customer_response.dart';
import 'package:customer_data/models/customer_search/customer_search_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logs_data/logger.dart';


void main() {
  String getFileContent(String fileName) => File('test/$fileName').readAsStringSync();


  test('parse json success', () async {

    var input = getFileContent('response.json'); // add files inside test folder.
    var response = json.decode(input);

    try {
      var model = AccountDetailsResponse.fromJson(response);
      Log.v('RESP is ${model.toString()}');
    } on DioError catch (e) {
      Log.v('error: ${e.toString()}');
    }

  });
}
