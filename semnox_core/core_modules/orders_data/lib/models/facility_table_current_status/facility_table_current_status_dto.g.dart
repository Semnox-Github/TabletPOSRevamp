// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_current_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableCurrentStatusDTO _$$_FacilityTableCurrentStatusDTOFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityTableCurrentStatusDTO(
      facilityId: json['FacilityId'] as int,
      facilityTableStatusChangeLogId:
          json['FacilityTableStatusChangeLogId'] as int,
      tableId: json['TableId'] as int,
      tableName: json['tableName'] as String?,
      mergedWithTableIdName: json['mergedWithTableIdName'] as String?,
      tableCurrentStatus: json['TableCurrentStatus'] as String,
      tableCurrentStatusId: json['TableCurrentStatusId'] as int,
      transactionStatus: json['TransactionStatus'] as String,
      transactionStatusId: json['TransactionStatusId'] as int,
      mergedWithTableId: json['MergedWithTableId'] as int,
      tableCurrentStatusTime: json['TableCurrentStatusTime'] as String?,
      transactionStatusChangeDate:
          json['TransactionStatusChangeDate'] as String?,
      isAccessible: json['IsAccessible'] as bool,
      elapsedTimeInMinutes: (json['ElapsedTimeInMinutes'] as num).toDouble(),
      status: json['Status'] as String,
      notes: json['Notes'] as String,
      additionalComments: json['AdditionalComments'] as String,
      paymentStatus: json['PaymentStatus'] as String,
      paymentStatusId: json['PaymentStatusId'] as int,
      paymentStatusChangeDate: json['PaymentStatusChangeDate'] as String?,
      color: json['Color'] as String,
      character: json['Character'] as String,
      reserveComments: json['ReserveComments'] as String,
      customerName: json['CustomerName'] as String,
      contact: json['Contact'] as String,
      occasion: json['Occasion'] as String,
      reserveFromTime: json['ReserveFromTime'] as String,
      reserveToTime: json['ReserveToTime'] as String,
    );

Map<String, dynamic> _$$_FacilityTableCurrentStatusDTOToJson(
        _$_FacilityTableCurrentStatusDTO instance) =>
    <String, dynamic>{
      'FacilityId': instance.facilityId,
      'FacilityTableStatusChangeLogId': instance.facilityTableStatusChangeLogId,
      'TableId': instance.tableId,
      'tableName': instance.tableName,
      'mergedWithTableIdName': instance.mergedWithTableIdName,
      'TableCurrentStatus': instance.tableCurrentStatus,
      'TableCurrentStatusId': instance.tableCurrentStatusId,
      'TransactionStatus': instance.transactionStatus,
      'TransactionStatusId': instance.transactionStatusId,
      'MergedWithTableId': instance.mergedWithTableId,
      'TableCurrentStatusTime': instance.tableCurrentStatusTime,
      'TransactionStatusChangeDate': instance.transactionStatusChangeDate,
      'IsAccessible': instance.isAccessible,
      'ElapsedTimeInMinutes': instance.elapsedTimeInMinutes,
      'Status': instance.status,
      'Notes': instance.notes,
      'AdditionalComments': instance.additionalComments,
      'PaymentStatus': instance.paymentStatus,
      'PaymentStatusId': instance.paymentStatusId,
      'PaymentStatusChangeDate': instance.paymentStatusChangeDate,
      'Color': instance.color,
      'Character': instance.character,
      'ReserveComments': instance.reserveComments,
      'CustomerName': instance.customerName,
      'Contact': instance.contact,
      'Occasion': instance.occasion,
      'ReserveFromTime': instance.reserveFromTime,
      'ReserveToTime': instance.reserveToTime,
    };
