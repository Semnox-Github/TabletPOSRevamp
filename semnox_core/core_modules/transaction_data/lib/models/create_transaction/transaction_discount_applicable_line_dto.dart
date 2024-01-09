

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_discount_applicable_line_dto.freezed.dart';
part 'transaction_discount_applicable_line_dto.g.dart';

@freezed
class TransactionDiscountApplicableLineDto with _$TransactionDiscountApplicableLineDto {
  const factory TransactionDiscountApplicableLineDto({
    @JsonKey(name: 'TransactionDiscountApplicableLineId')
    int? transactionDiscountApplicableLineId,
    @JsonKey(name: 'TransactionId')
    int? transactionId,
    @JsonKey(name: 'TransactionDiscountId')
    int? transactionDiscountId,
    @JsonKey(name: 'TransactionLineId')
    int? transactionLineId,
    @JsonKey(name: 'DiscountAmount')
    dynamic discountAmount,
    @JsonKey(name: 'DiscountPercentage')
    dynamic discountPercentage,
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
    @JsonKey(name: 'TransactionTaxLineDTOList')
    List<dynamic>? transactionTaxLineDTOList,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    bool? isChangedRecursive,
  }) = _TransactionDiscountApplicableLineDto;

  factory TransactionDiscountApplicableLineDto.fromJson(Map<String, dynamic> json) => _$TransactionDiscountApplicableLineDtoFromJson(json);
}
