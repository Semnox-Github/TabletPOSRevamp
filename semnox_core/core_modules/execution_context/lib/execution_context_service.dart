

import 'dart:convert';

import 'package:execution_context/execution_context_service_helper.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExecutionContextService {

  late ExecutionContextServiceHelper executionContextServiceHelper;
  static final ExecutionContextService _instance = ExecutionContextService._internal();
  ExecutionContextService._internal();

  factory ExecutionContextService(ExecutionContextServiceHelper serviceHelper) {
    _instance.executionContextServiceHelper = serviceHelper;
    return _instance;
  }


  Future<void> clearExecutionContext() async {
    await executionContextServiceHelper.clearExecutionContext();
  }

  Future<void> setExecutionContext(ExecutionContextDTO executionContext) async {
    await executionContextServiceHelper.setExecutionContext(executionContext);
  }

  ExecutionContextDTO? getExecutionContext() {
    return executionContextServiceHelper.getExecutionContext();
  }
}