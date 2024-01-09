// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution_context_dto.freezed.dart';

part 'execution_context_dto.g.dart';

@freezed
class ExecutionContextDTO with _$ExecutionContextDTO {
  const factory ExecutionContextDTO({
    String? posMachineGuid,
    String? webApiToken,
    String? token,
    int? languageId,
    bool? isCorporate,
    int? userPKId,
    int? userRoleId,
    int? machineId,
    int? siteId,
    int? sitePKId,
    String? userId,
    String? posMachineName,
    String? languageCode,
    @Default(false) bool isUserLoggedIn
  }) = _ExecutionContextDTO;

  factory ExecutionContextDTO.fromJson(Map<String, Object?> json) =>
      _$ExecutionContextDTOFromJson(json);
}
