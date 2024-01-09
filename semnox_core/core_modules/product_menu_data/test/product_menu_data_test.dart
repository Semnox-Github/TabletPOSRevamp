import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/product_price_container/product_price_container_response.dart';
import 'package:product_menu_data/models/products_container/products_container_response.dart';


void main() {
  String getFileContent(String fileName) => File('test/$fileName').readAsStringSync();

  test('Date value is in UTC', () {
    // final currentTime = DateTime.now().toUtc();
    // final startDate = currentTime.toIso8601String();
    // final endDate = currentTime.add(const Duration(hours: 1)).toIso8601String();
    // final startDateString = startDate.substring(0, startDate.indexOf('.'));
    // final endDateString = endDate.substring(0, endDate.indexOf('.'));
    var timeString = DateTime.now().toUtc().toIso8601String();
    final date = timeString.substring(0, timeString.indexOf('.'));
    print('DATE is $date');
  });

  test('parse json success', () async {

    var input = getFileContent('response.json'); // add files inside test folder.
    var response = json.decode(input);
    
    try {
      var model = ProductsContainerResponse.fromJson(response);
      print('RESP is ${model.toString()}');
    } on DioError catch (e) {
      print('error: ${e.toString()}');
    }

  });
}
