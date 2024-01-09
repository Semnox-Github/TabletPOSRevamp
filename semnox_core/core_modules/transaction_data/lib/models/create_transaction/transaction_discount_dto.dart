

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_discount_applicable_line_dto.dart';

part 'transaction_discount_dto.freezed.dart';
part 'transaction_discount_dto.g.dart';

@freezed
class TransactionDiscountDto with _$TransactionDiscountDto {
  const factory TransactionDiscountDto({
    @JsonKey(name: 'TransactionDiscountId')
    int? transactionDiscountId,
    @JsonKey(name: 'TransactionId')
    int? transactionId,
    @JsonKey(name: 'DiscountId')
    int? discountId,
    @JsonKey(name: 'DiscountName')
    String? discountName,
    @JsonKey(name: 'DiscountAmount')
    dynamic discountAmount,
    @JsonKey(name: 'DiscountPercentage')
    dynamic discountPercentage,
    @JsonKey(name: 'ApprovedBy')
    int? approvedBy,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'ApplicationType')
    String? applicationType,
    @JsonKey(name: 'ApplicationCardId')
    int? applicationCardId,
    @JsonKey(name: 'DiscountType')
    String? discountType,
    @JsonKey(name: 'CouponNumber')
    String? couponNumber,
    @JsonKey(name:'Indicator')
    String? indicator,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
    List<dynamic>? transactionDiscountCriteriaLineDTOList,
    @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
    List<TransactionDiscountApplicableLineDto>?
    transactionDiscountApplicableLineDTOList,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    bool? isChangedRecursive,
  }) = _TransactionDiscountDto;

  factory TransactionDiscountDto.fromJson(Map<String, dynamic> json) => _$TransactionDiscountDtoFromJson(json);
}
