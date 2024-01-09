// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_function_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionFunctionData _$$_TransactionFunctionDataFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionFunctionData(
      taskTypesContainerDTOList: (json['TaskTypesContainerDTOList']
              as List<dynamic>)
          .map((e) => TaskTypesContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$$_TransactionFunctionDataToJson(
        _$_TransactionFunctionData instance) =>
    <String, dynamic>{
      'TaskTypesContainerDTOList': instance.taskTypesContainerDTOList,
      'hash': instance.hash,
    };
