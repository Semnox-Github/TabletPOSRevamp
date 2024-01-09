// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_functions/task_type_container_dto.dart';

part 'transaction_function_data.freezed.dart';
part 'transaction_function_data.g.dart';

@freezed
class TransactionFunctionData with _$TransactionFunctionData {
  const factory TransactionFunctionData({
    @JsonKey(name: 'TaskTypesContainerDTOList')
    required List<TaskTypesContainerDTO> taskTypesContainerDTOList,
    String? hash,
  }) = _TransactionFunctionData;

  factory TransactionFunctionData.fromJson(Map<String, dynamic> json) => _$TransactionFunctionDataFromJson(json);
}