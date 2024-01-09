// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_status_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransacationStatusContainerData _$$_TransacationStatusContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_TransacationStatusContainerData(
      transactionStatusContainerDTO: (json['TransactionStatusContainerDTOList']
              as List<dynamic>)
          .map((e) =>
              TransactionStatusContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$$_TransacationStatusContainerDataToJson(
        _$_TransacationStatusContainerData instance) =>
    <String, dynamic>{
      'TransactionStatusContainerDTOList':
          instance.transactionStatusContainerDTO,
      'hash': instance.hash,
    };
