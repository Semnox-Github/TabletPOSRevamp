// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_table_current_status_dto.freezed.dart';
part 'facility_table_current_status_dto.g.dart';

@freezed
class FacilityTableCurrentStatusDTO with _$FacilityTableCurrentStatusDTO {
  const factory FacilityTableCurrentStatusDTO({
    @JsonKey(name: 'FacilityId')
    required int facilityId,
    @JsonKey(name: 'FacilityTableStatusChangeLogId')
    required int facilityTableStatusChangeLogId,
    @JsonKey(name: 'TableId')
    required int tableId,
    String? tableName,
    String? mergedWithTableIdName,
    @JsonKey(name: 'TableCurrentStatus')
    required String tableCurrentStatus,
    @JsonKey(name: 'TableCurrentStatusId')
    required int tableCurrentStatusId,
    @JsonKey(name: 'TransactionStatus')
    required String transactionStatus,
    @JsonKey(name: 'TransactionStatusId')
    required int transactionStatusId,
    @JsonKey(name: 'MergedWithTableId')
    required int mergedWithTableId,
    @JsonKey(name: 'TableCurrentStatusTime')
    String? tableCurrentStatusTime,
    @JsonKey(name: 'TransactionStatusChangeDate')
    String? transactionStatusChangeDate,
    @JsonKey(name: 'IsAccessible')
    required bool isAccessible,
    @JsonKey(name: 'ElapsedTimeInMinutes')
    required double elapsedTimeInMinutes,
    @JsonKey(name: 'Status')
    required String status,
    @JsonKey(name: 'Notes')
    required String notes,
    @JsonKey(name: 'AdditionalComments')
    required String additionalComments,
    @JsonKey(name: 'PaymentStatus')
    required String paymentStatus,
    @JsonKey(name: 'PaymentStatusId')
    required int paymentStatusId,
    @JsonKey(name: 'PaymentStatusChangeDate')
    String? paymentStatusChangeDate,
    @JsonKey(name: 'Color')
    required String color,
    @JsonKey(name: 'Character')
    required String character,
    @JsonKey(name: 'ReserveComments')
    required String reserveComments,
    @JsonKey(name: 'CustomerName')
    required String customerName,
    @JsonKey(name: 'Contact')
    required String contact,
    @JsonKey(name: 'Occasion')
    required String occasion,
    @JsonKey(name: 'ReserveFromTime')
    required String reserveFromTime,
    @JsonKey(name: 'ReserveToTime')
    required String reserveToTime,
  }) = _FacilityTableCurrentStatusDTO;

  factory FacilityTableCurrentStatusDTO.fromJson(Map<String, dynamic> json) => _$FacilityTableCurrentStatusDTOFromJson(json);
}