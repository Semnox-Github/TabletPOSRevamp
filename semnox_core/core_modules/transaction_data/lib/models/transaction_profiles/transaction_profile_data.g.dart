// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionProfileData _$$_TransactionProfileDataFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionProfileData(
      transactionProfileContainerDTOList:
          (json['TransactionProfileContainerDTOList'] as List<dynamic>)
              .map((e) => TransactionProfileContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_TransactionProfileDataToJson(
        _$_TransactionProfileData instance) =>
    <String, dynamic>{
      'TransactionProfileContainerDTOList':
          instance.transactionProfileContainerDTOList,
      'Hash': instance.hash,
    };
