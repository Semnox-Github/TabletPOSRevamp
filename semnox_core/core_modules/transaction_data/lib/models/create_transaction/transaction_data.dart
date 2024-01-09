// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_discount_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';

part 'transaction_data.freezed.dart';
part 'transaction_data.g.dart';

@freezed
class TransactionData with _$TransactionData {
  const factory TransactionData({
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'ApprovedBy')
    required int approvedBy,
    @JsonKey(name: 'TransactionReopenedCount')
    required int transactionReopenedCount,
    @JsonKey(name: 'TransactionInitiatedTime')
    dynamic? transactionInitiatedTime,
    @JsonKey(name: 'TransactionClosedTime')
    dynamic? transactionClosedTime,
    @JsonKey(name: 'TransactionCancelledTime')
    dynamic? transactionCancelledTime,
    @JsonKey(name: 'TransactionReopenedTime')
    dynamic? transactionReopenedTime,
    @JsonKey(name: 'SessionId')
    required int sessionId,
    @JsonKey(name: 'TentNumber')
    String? tentNumber,
    @JsonKey(name: 'GuestContactEmail')
    String? guestContactEmail,
    @JsonKey(name: 'LockStatus')
    required String lockStatus,
    @JsonKey(name: 'LockedByPOSMachineId')
    required int lockedByPosMachineId,
    @JsonKey(name: 'LockedBySiteId')
    required int lockedBySiteId,
    @JsonKey(name: 'LockedByUserId')
    required int lockedByUserId,
    @JsonKey(name: 'LockedTime')
    dynamic? lockedTime,
    @JsonKey(name: 'ProcessedForLoyalty')
    required bool processedForLoyalty,
    @JsonKey(name: 'TransactionTypeId')
    required int transactionTypeId,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'TransactionPaymentStatus')
    String? transactionPaymentStatus,
    @JsonKey(name: 'TransactionPaymentStatusId')
    required int transactionPaymentStatusId,
    @JsonKey(name: 'TransactionPaymentStatusChangeDate')
    dynamic? transactionPaymentStatusChangeDate,
    @JsonKey(name: 'IsNonChargeable')
    required bool isNonChargeable,
    @JsonKey(name: 'GuestCount')
    required int guestCount,
    @JsonKey(name: 'GuestContactNumber')
    String? guestContactNumber,
    @JsonKey(name: 'GuestName')
    String? guestName,
    @JsonKey(name: 'TransactionIdentifier')
    String? transactionIdentifier,
    @JsonKey(name: 'TransactionTaxTotal')
    required double transactionTaxTotal,
    @JsonKey(name: 'Channel')
    String? channel,
    @JsonKey(name: 'TransactionPaymentTotal')
    required double transactionPaymentTotal,
    @JsonKey(name: 'TransactionDate')
    String? transactionDate,
    @JsonKey(name: 'TransactionAmount')
    required double transactionAmount,
    @JsonKey(name: 'TransactionNetAmount')
    required double transactionNetAmount,
    @JsonKey(name: 'UserId')
    required int userId,
    @JsonKey(name: 'PrimaryCardId')
    required int primaryCardId,
    @JsonKey(name: 'OrderId')
    required int orderId,
    @JsonKey(name: 'POSTypeId')
    required int posTypeId,
    @JsonKey(name: 'TransactionNumber')
    required String? transactionNumber,
    @JsonKey(name: 'TransactionOTP')
    String? transactionOTP,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'POSMachineId')
    required int posMachineId,
    @JsonKey(name: 'Status')
    required String status,
    @JsonKey(name: 'TransactionStatus')
    required String transactionStatus,
    @JsonKey(name: 'TransactionStatusId')
    required int transactionStatusId,
    @JsonKey(name: 'TransactionStatusChangeDate')
    dynamic? transactionStatusChangeDate,
    @JsonKey(name: 'TransactionProfileId')
    required int transactionProfileId,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'TokenNumber')
    dynamic? tokenNumber,
    @JsonKey(name: 'OriginalSystemReference')
    String? originalSystemReference,
    @JsonKey(name: 'CustomerId')
    required int customerId,
    @JsonKey(name: 'ExternalSystemReference')
    String? externalSystemReference,
    @JsonKey(name: 'ReprintCount')
    required int reprintCount,
    @JsonKey(name: 'OriginalTransactionId')
    required int originalTransactionId,
    @JsonKey(name: 'OrderTypeGroupId')
    required int orderTypeGroupId,
    @JsonKey(name: 'PrintCount')
    required int printCount,
    @JsonKey(name: 'SaveStartTime')
    dynamic? saveStartTime,
    @JsonKey(name: 'SaveEndTime')
    dynamic? saveEndTime,
    @JsonKey(name: 'PrintStartTime')
    dynamic? printStartTime,
    @JsonKey(name: 'PrintEndTime')
    dynamic? printEndTime,
    @JsonKey(name: 'TransactionDiscountTotal')
    required double transactionDiscountTotal,
    @JsonKey(name: 'TransactionDiscountDTOList')
    required List<TransactionDiscountDto> transactionDiscountDTOList,
    @JsonKey(name: 'TransactionPaymentDTOList')
    required List<TransactionPaymentDTO> transactionPaymentDTOList,
    @JsonKey(name: 'TransactionLineDTOList')
    required List<TransactionLineDTO> transactionLineDTOList,
    @JsonKey(name: 'TrxLinePaymentMappingDTOList')
    required List<dynamic> trxLinePaymentMappingDTOList,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'IsAccessible')
    required bool isAccessible,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @Default({})
    Map<int, List<TransactionLineDTO>> transactionLinesGroups,
  }) = _TransactionData;

  factory TransactionData.fromJson(Map<String, dynamic> json) => _$TransactionDataFromJson(json);
}