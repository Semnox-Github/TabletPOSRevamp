// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blanance_transfer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanceTransferData _$$_BalanceTransferDataFromJson(
        Map<String, dynamic> json) =>
    _$_BalanceTransferData(
      fromCardId: json['FromCardId'] as int?,
      transferDetails: (json['TransferDetails'] as List<dynamic>?)
          ?.map((e) => TransferDetailsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      managerId: json['ManagerId'] as int?,
      remarks: json['Remarks'] as String?,
    );

Map<String, dynamic> _$$_BalanceTransferDataToJson(
        _$_BalanceTransferData instance) =>
    <String, dynamic>{
      'FromCardId': instance.fromCardId,
      'TransferDetails': instance.transferDetails,
      'ManagerId': instance.managerId,
      'Remarks': instance.remarks,
    };
