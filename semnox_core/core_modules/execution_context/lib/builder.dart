
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/execution_context_service.dart';
import 'package:execution_context/execution_context_service_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExecutionContextBuilder {

  static Future<ExecutionContextBLContract> build() async {

    final sharedPreferences = await SharedPreferences.getInstance();
    final execContextServiceHelper = ExecutionContextServiceHelper(sharedPreferences);

    final executionContextService = ExecutionContextService(execContextServiceHelper);
    final executionContextBL = ExecutionContextBLImpl(executionContextService);

    return executionContextBL;
  }
}