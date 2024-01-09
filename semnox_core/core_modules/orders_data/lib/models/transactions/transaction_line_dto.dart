// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/transactions/transaction_account_dto.dart';
import 'package:orders_data/models/transactions/transaction_tax_line_dto.dart';

part 'transaction_line_dto.freezed.dart';
part 'transaction_line_dto.g.dart';

@freezed
class TransactionLineDTO with _$TransactionLineDTO {
  const factory TransactionLineDTO({
    @JsonKey(name: 'LineDate')
    String? lineDate,
    @JsonKey(name: 'LineStatus')
    required String lineStatus,
    @JsonKey(name: 'LineStatusId')
    required int lineStatusId,
    @JsonKey(name: 'LineStatusChangeDate')
    dynamic? lineStatusChangeDate,
    @JsonKey(name: 'CourseName')
    required String courseName,
    @JsonKey(name: 'SeatName')
    required String seatName,
    @JsonKey(name: 'ProcessedForLoyalty')
    required bool processedForLoyalty,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'LineReversedDate')
    dynamic? lineReversedDate,
    @JsonKey(name: 'LineFulfilledDate')
    dynamic? lineFulfilledDate,
    @JsonKey(name: 'LineBookedDate')
    dynamic? lineBookedDate,
    @JsonKey(name: 'LineOrderedDate')
    dynamic? lineOrderedDate,
    @JsonKey(name: 'ExternalSourceReference')
    required String externalSourceReference,
    @JsonKey(name: 'SystemReference')
    dynamic? systemReference,
    @JsonKey(name: 'ComboProductId')
    required int comboProductId,
    @JsonKey(name: 'ModifierSetId')
    required int modifierSetId,
    @JsonKey(name: 'ModifierSetDetailId')
    required int modifierSetDetailId,
    @JsonKey(name: 'IsParentModifier')
    required bool isParentModifier,
    @JsonKey(name: 'IsFreeModifier')
    required bool isFreeModifier,
    @JsonKey(name: 'IsNonChargeable')
    required bool isNonChargeable,
    @JsonKey(name: 'OrderTypeId')
    required int orderTypeId,
    @JsonKey(name: 'IsReversed')
    required bool isReversed,
    @JsonKey(name: 'ViewGroupingNumber')
    required int viewGroupingNumber,
    @JsonKey(name: 'ProductSegmentId')
    required int productSegmentId,
    @JsonKey(name: 'OnPrintHold')
    required bool onPrintHold,
    @JsonKey(name: 'Is9999Product')
    required bool is9999Product,
    @JsonKey(name: 'IsCrossSellProduct')
    required bool isCrossSellProduct,
    @JsonKey(name: 'IsUpsellProduct')
    required bool isUpsellProduct,
    @JsonKey(name: 'SeatNumber')
    int? seatNumber,
    @JsonKey(name: 'TagNumber')
    required String tagNumber,
    @JsonKey(name: 'TransactionProfileId')
    required int transactionProfileId,
    @JsonKey(name: 'AccountId')
    int? accountId,
    @JsonKey(name: 'PriceType')
    required String priceType,
    @JsonKey(name: 'UserOverriddenPrice')
    dynamic? userOverriddenPrice,
    @JsonKey(name: 'MembershipPrice')
    dynamic? membershipPrice,
    @JsonKey(name: 'ComboAllocatedProductPrice')
    dynamic? comboAllocatedProductPrice,
    @JsonKey(name: 'PromotionPrice')
    dynamic? promotionPrice,
    @JsonKey(name: 'TransactionProfilePrice')
    dynamic? transactionProfilePrice,
    @JsonKey(name: 'UserRolePrice')
    dynamic? userRolePrice,
    @JsonKey(name: 'BasePrice')
    required double basePrice,
    @JsonKey(name: 'LineNumber')
    required int lineNumber,
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'CategoryId')
    required int categoryId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'ApprovedBy')
    required String approvedBy,
    @JsonKey(name: 'AdditionalLineInformation')
    required String additionalLineInformation,
    @JsonKey(name: 'DiscountIdentifier')
    required String discountIdentifier,
    @JsonKey(name: 'CategoryName')
    required String categoryName,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'Quantity')
    required double quantity,
    @JsonKey(name: 'Amount')
    required double amount,
    @JsonKey(name: 'NetAmount')
    required double netAmount,
    @JsonKey(name: 'DiscountedAmountPreTax')
    required double discountedAmountPreTax,
    @JsonKey(name: 'AccountCredits')
    double? accountCredits,
    @JsonKey(name: 'AccountCourtesy')
    double? accountCourtesy,
    @JsonKey(name: 'TaxPercentage')
    required double taxPercentage,
    @JsonKey(name: 'TaxId')
    required int taxId,
    @JsonKey(name: 'ParentTransactionLineId')
    required int parentTransactionLineId,
    @JsonKey(name: 'AccountTime')
    double? accountTime,
    @JsonKey(name: 'AccountBonus')
    double? accountBonus,
    @JsonKey(name: 'AccountTickets')
    double? accountTickets,
    @JsonKey(name: 'AccountLoyaltyPoints')
    double? accountLoyaltyPoints,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'PromotionId')
    required int promotionId,
    @JsonKey(name: 'ReceiptPrinted')
    required  bool receiptPrinted,
    @JsonKey(name: 'KOTPrintCount')
    required int? kotPrintCount,
    @JsonKey(name: 'GamePlayId')
    required int gamePlayId,
    @JsonKey(name: 'KDSSent')
    required bool kdsSent,
    @JsonKey(name: 'CancelledTime')
    dynamic? cancelledTime,
    @JsonKey(name: 'CancelledBy')
    required String cancelledBy,
    @JsonKey(name: 'IsWaiverSignRequired')
    required bool isWaiverSignRequired,
    @JsonKey(name: 'OriginalLineId')
    required int originalLineId,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'MembershipId')
    required int membershipId,
    @JsonKey(name: 'MembershipRewardsId')
    required int membershipRewardsId,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsAmountChanged')
    required bool isAmountChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @JsonKey(name: 'ProductName')
    required String productName,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'TransactionLineDTOList')
    required List<TransactionLineDTO> transactionLineDTOList,
    @JsonKey(name: 'TransactionAccountDTOList')
    List<TransactionLineAccountDto>? transactionAccountDTOList,
    @JsonKey(name: 'TransactionTaxLineDTOList')
    required List<TransactionTaxLineDTO> transactionTaxLineDTOList,
    @JsonKey(name: 'CancelCode')
    required String cancelCode,
  }) = _TransactionLineDTO;

  factory TransactionLineDTO.fromJson(Map<String, dynamic> json) => _$TransactionLineDTOFromJson(json);
}
