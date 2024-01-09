// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_search_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableSearchData _$$_TableSearchDataFromJson(Map<String, dynamic> json) =>
    _$_TableSearchData(
      facilityId: json['FacilityId'] as int,
      facilityTableStatusChangeLogId:
          json['FacilityTableStatusChangeLogId'] as int,
      tableId: json['TableId'] as int,
      tableName: json['TableName'] as String?,
      capacity: json['Capacity'] as int?,
      tableCurrentStatus: json['TableCurrentStatus'] as String,
      tableCurrentStatusId: json['TableCurrentStatusId'] as int,
      transactionStatus: json['TransactionStatus'] as String,
      transactionStatusId: json['TransactionStatusId'] as int,
      mergedWithTableId: json['MergedWithTableId'] as int,
      mergedWith: json['MergedWith'] as String?,
      tableCurrentStatusTime: json['TableCurrentStatusTime'],
      transactionStatusChangeDate: json['TransactionStatusChangeDate'],
      isAccessible: json['IsAccessible'] as bool,
      elapsedTimeInMinutes: (json['ElapsedTimeInMinutes'] as num).toDouble(),
      status: json['Status'] as String,
      notes: json['Notes'] as String,
      additionalComments: json['AdditionalComments'] as String,
      paymentStatus: json['PaymentStatus'] as String,
      paymentStatusId: json['PaymentStatusId'] as int,
      paymentStatusChangeDate: json['PaymentStatusChangeDate'],
      color: json['Color'] as String,
      character: json['Character'] as String,
      reserveComments: json['ReserveComments'] as String,
      customerName: json['CustomerName'] as String,
      contact: json['Contact'] as String,
      occasion: json['Occasion'] as String,
      reserveFromTime: json['ReserveFromTime'] as String,
      reserveToTime: json['ReserveToTime'] as String,
    );

Map<String, dynamic> _$$_TableSearchDataToJson(_$_TableSearchData instance) =>
    <String, dynamic>{
      'FacilityId': instance.facilityId,
      'FacilityTableStatusChangeLogId': instance.facilityTableStatusChangeLogId,
      'TableId': instance.tableId,
      'TableName': instance.tableName,
      'Capacity': instance.capacity,
      'TableCurrentStatus': instance.tableCurrentStatus,
      'TableCurrentStatusId': instance.tableCurrentStatusId,
      'TransactionStatus': instance.transactionStatus,
      'TransactionStatusId': instance.transactionStatusId,
      'MergedWithTableId': instance.mergedWithTableId,
      'MergedWith': instance.mergedWith,
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
