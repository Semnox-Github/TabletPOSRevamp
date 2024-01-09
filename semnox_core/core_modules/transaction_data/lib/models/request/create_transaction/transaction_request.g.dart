// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionRequest _$$_TransactionRequestFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionRequest(
      guestCount: json['GuestCount'] as int?,
      transactionProfileId: json['TransactionProfileId'] as int,
      primaryAccountNumber: json['PrimaryAccountNumber'] as String?,
      guestName: json['GuestName'] as String?,
      transactionIdentifier: json['TransactionIdentifier'] as String?,
      guestContact: json['GuestContact'] as String?,
      tentNumber: json['TentNumber'] as String?,
      remarks: json['Remarks'] as String?,
      transactionDateTime: json['TransactionDateTime'] as String?,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionRequestToJson(
        _$_TransactionRequest instance) =>
    <String, dynamic>{
      'GuestCount': instance.guestCount,
      'TransactionProfileId': instance.transactionProfileId,
      'PrimaryAccountNumber': instance.primaryAccountNumber,
      'GuestName': instance.guestName,
      'TransactionIdentifier': instance.transactionIdentifier,
      'GuestContact': instance.guestContact,
      'TentNumber': instance.tentNumber,
      'Remarks': instance.remarks,
      'TransactionDateTime': instance.transactionDateTime,
      'ApprovalDTO': instance.approvalDTO,
    };
