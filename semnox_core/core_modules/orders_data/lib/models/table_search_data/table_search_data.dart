// To parse this JSON data, do
//
//     final facilityTableCurrentSatusView = facilityTableCurrentSatusViewFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
part 'table_search_data.freezed.dart';
part 'table_search_data.g.dart';

@freezed
class TableSearchData with _$TableSearchData {
  const factory TableSearchData({
    @JsonKey(name: 'FacilityId')
    required int facilityId,
    @JsonKey(name: 'FacilityTableStatusChangeLogId')
    required int facilityTableStatusChangeLogId,
    @JsonKey(name: 'TableId')
    required int tableId,
    @JsonKey(name: 'TableName')
    String? tableName,
    @JsonKey(name: 'Capacity')
    int? capacity,
    @JsonKey(name: 'TableCurrentStatus')
    required String tableCurrentStatus,
    @JsonKey(name: 'TableCurrentStatusId')
    required int tableCurrentStatusId,
    @JsonKey(name: 'TransactionStatus')
    required  String transactionStatus,
    @JsonKey(name: 'TransactionStatusId')
    required int transactionStatusId,
    @JsonKey(name: 'MergedWithTableId')
    required  int mergedWithTableId,
    @JsonKey(name: 'MergedWith')
    String? mergedWith,
    @JsonKey(name: 'TableCurrentStatusTime')
    dynamic? tableCurrentStatusTime,
    @JsonKey(name: 'TransactionStatusChangeDate')
    dynamic? transactionStatusChangeDate,
    @JsonKey(name: 'IsAccessible')
    required bool isAccessible,
    @JsonKey(name: 'ElapsedTimeInMinutes')
    required double elapsedTimeInMinutes,
    @JsonKey(name: 'Status')
    required String status,
    @JsonKey(name: 'Notes')
    required  String notes,
    @JsonKey(name: 'AdditionalComments')
    required  String additionalComments,
    @JsonKey(name: 'PaymentStatus')
    required  String paymentStatus,
    @JsonKey(name: 'PaymentStatusId')
    required  int paymentStatusId,
    @JsonKey(name: 'PaymentStatusChangeDate')
    dynamic? paymentStatusChangeDate,
    @JsonKey(name: 'Color')
    required  String color,
    @JsonKey(name: 'Character')
    required String character,
    @JsonKey(name: 'ReserveComments')
    required String reserveComments,
    @JsonKey(name: 'CustomerName')
    required String customerName,
    @JsonKey(name: 'Contact')
    required  String contact,
    @JsonKey(name: 'Occasion')
    required String occasion,
    @JsonKey(name: 'ReserveFromTime')
    required   String reserveFromTime,
    @JsonKey(name: 'ReserveToTime')
    required  String reserveToTime,
  }) = _TableSearchData;

  factory TableSearchData.fromJson(Map<String, dynamic> json) => _$TableSearchDataFromJson(json);
}
