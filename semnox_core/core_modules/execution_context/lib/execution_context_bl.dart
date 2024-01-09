
import 'dart:convert';

import 'package:execution_context/execution_context_service.dart';

import 'models/execution_context_dto.dart';

abstract class ExecutionContextBLContract {
  Future<void> setExecutionContext(ExecutionContextDTO executionContext);
  Future<void> clearExecutionContext();
  ExecutionContextDTO? getExecutionContext();
}

class ExecutionContextBLImpl implements ExecutionContextBLContract {

  final ExecutionContextService executionContextService;

  ExecutionContextBLImpl(this.executionContextService);

  @override
  Future<void> clearExecutionContext() async {
    await executionContextService.clearExecutionContext();
  }

  @override
  Future<void> setExecutionContext(ExecutionContextDTO executionContext) async {
    await executionContextService.setExecutionContext(executionContext);
  }

  @override
  ExecutionContextDTO? getExecutionContext() {
    return executionContextService.getExecutionContext();
  }

}