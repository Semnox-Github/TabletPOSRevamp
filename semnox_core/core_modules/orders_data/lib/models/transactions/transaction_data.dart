
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/transactions/transaction_discount_dto.dart';
import 'package:orders_data/models/transactions/transaction_line_dto.dart';
import 'package:orders_data/models/transactions/transaction_payment_dto.dart';
import 'package:orders_data/models/transactions/trx_line_payment_mapping_dto.dart';


part 'transaction_data.freezed.dart';
part 'transaction_data.g.dart';

@freezed
class TransactionsData with _$TransactionsData{
  const factory TransactionsData({
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'ApprovedBy')
    dynamic? approvedBy,
    @JsonKey(name: 'TransactionReopenedCount')
    required int TransactionReopenedCount,
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
    required String? tentNumber,
    @JsonKey(name: 'GuestContactEmail')
    required String? guestContactEmail,
    @JsonKey(name: 'LockStatus')
    required String? lockStatus,
    @JsonKey(name: 'LockedByPOSMachineId')
    required int lockedByPOSMachineId,
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
    required String transactionPaymentStatus,
    @JsonKey(name: 'TransactionPaymentStatusId')
    required int transactionPaymentStatusId,
    @JsonKey(name: 'TransactionPaymentStatusChangeDate')
    dynamic? transactionPaymentStatusChangeDate,
    @JsonKey(name: 'IsNonChargeable')
    required bool isNonChargeable,
    @JsonKey(name: 'GuestCount')
    required int guestCount,
    @JsonKey(name: 'GuestContactNumber')
    required String guestContactNumber,
    @JsonKey(name: 'GuestName')
    required String guestName,
    @JsonKey(name: 'TransactionIdentifier')
    required String transactionIdentifier,
    @JsonKey(name: 'TransactionTaxTotal')
    required double transactionTaxTotal,
    @JsonKey(name: 'Channel')
    required String channel,
    @JsonKey(name: 'TransactionPaymentTotal')
    required double transactionPaymentTotal,
    @JsonKey(name: 'TransactionDate')
    required String transactionDate,
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
    required int postTypeId,
    @JsonKey(name: 'TransactionNumber')
    required String transactionNumber,
    @JsonKey(name: 'TransactionOTP')
    required String transactionOTP,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'POSMachineId')
    required int posMachineId,
    @JsonKey(name: 'POSMachine')
    required String posMachine,
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
    @JsonKey(name: 'TransactionProfileName')
    required String transactionProfileName,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String tastUpdatedBy,
    @JsonKey(name: 'TokenNumber')
    required String tokenNumber,
    @JsonKey(name: 'OriginalSystemReference')
    required String originalSystemReference,
    @JsonKey(name: 'CustomerId')
    required int customerId,
    @JsonKey(name: 'ExternalSystemReference')
    required String externalSystemReference,
    @JsonKey(name: 'ReprintCount')
    required int ReprintCount,
    @JsonKey(name: 'OriginalTransactionId')
    required int originalTransactionId,
    @JsonKey(name: 'OrderTypeGroupId')
    required int orderTypeGroupId,
    @JsonKey(name: 'ProvisionalBillPrintCount')
    required int provisionalBillPrintCount,
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
    required List<TransactionDiscountDTO> transactionDiscountDTOList,
    @JsonKey(name: 'TransactionPaymentDTOList')
    required List<TransactionPaymentDto> transactionPaymentDTOList,
    @JsonKey(name: 'TransactionLineDTOList')
    required List<TransactionLineDTO> transactionLineDTOList,
    @JsonKey(name: 'TrxLinePaymentMappingDTOList')
    required List<TrxLinePaymentMappingDTO> trxLinePaymentMappingDTOList,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SiteId')
    required int SiteId,
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

  }) = _TransactionsData;

  factory TransactionsData.fromJson(Map<String, dynamic> json) => _$TransactionsDataFromJson(json);
}