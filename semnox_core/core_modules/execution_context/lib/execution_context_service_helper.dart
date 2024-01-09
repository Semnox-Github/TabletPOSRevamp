import 'dart:convert';

import 'package:execution_context/models/execution_context_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

const EXECUTION_CONTEXT_KEY = "EXEC_CONST_KEY";

class ExecutionContextServiceHelper {

  final SharedPreferences preferences;

  ExecutionContextServiceHelper(this.preferences) {
    dto = getFromPreferences();
  }

  ExecutionContextDTO? dto;

  Future<void> clearExecutionContext() async {
    await preferences.remove(EXECUTION_CONTEXT_KEY);
    dto = null;
  }

  Future<void> setExecutionContext(ExecutionContextDTO executionContext) async {
    String encodedMap = json.encode(executionContext.toJson());
    await preferences.setString(EXECUTION_CONTEXT_KEY, encodedMap);
    dto = getFromPreferences();
  }

  ExecutionContextDTO? getExecutionContext() {
    return dto;
  }

  ExecutionContextDTO? getFromPreferences(){
    var executionContextString = preferences.getString(EXECUTION_CONTEXT_KEY);
    if(executionContextString != null) {
      final executionContextMap = json.decode(executionContextString) as Map<String, dynamic>;
      return ExecutionContextDTO.fromJson(executionContextMap);
    }
    return null;
  }


}