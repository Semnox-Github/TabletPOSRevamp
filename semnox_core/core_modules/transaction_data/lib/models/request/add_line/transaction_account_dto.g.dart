// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionAccountDto _$$_TransactionAccountDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionAccountDto(
      transactionAccountId: json['TransactionAccountId'] as int?,
      transactionId: json['TransactionId'] as int?,
      transactionLineId: json['TransactionLineId'] as int?,
      accountId: json['AccountId'] as int?,
      tagNumber: json['TagNumber'] as String,
      serialNumber: json['SerialNumber'] as String?,
      existingAccount: json['ExistingAccount'] as bool,
      isActive: json['IsActive'] as bool,
    );

Map<String, dynamic> _$$_TransactionAccountDtoToJson(
        _$_TransactionAccountDto instance) =>
    <String, dynamic>{
      'TransactionAccountId': instance.transactionAccountId,
      'TransactionId': instance.transactionId,
      'TransactionLineId': instance.transactionLineId,
      'AccountId': instance.accountId,
      'TagNumber': instance.tagNumber,
      'SerialNumber': instance.serialNumber,
      'ExistingAccount': instance.existingAccount,
      'IsActive': instance.isActive,
    };
