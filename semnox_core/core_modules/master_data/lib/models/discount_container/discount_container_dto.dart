import 'package:freezed_annotation/freezed_annotation.dart';

import 'dicounted_products_container_dto.dart';
import 'discount_purchase_criteria_dto.dart';

part 'discount_container_dto.freezed.dart';
part 'discount_container_dto.g.dart';

@freezed
class DiscountContainerDto with _$DiscountContainerDto {
  const factory DiscountContainerDto({
    @JsonKey(name: 'automaticApply')
    String? discountContainerDtoListAutomaticApply,
    @JsonKey(name: 'applicationLimit')
    dynamic discountContainerDtoListApplicationLimit,
    @JsonKey(name: 'DiscountId')
    int? discountId,
    @JsonKey(name: 'DiscountName')
    String? discountName,
    @JsonKey(name: 'DiscountPercentage')
    dynamic discountPercentage,
    @JsonKey(name: 'DiscountAmount')
    dynamic discountAmount,
    @JsonKey(name: 'ManagerApprovalRequired')
    String? managerApprovalRequired,
    @JsonKey(name: 'RemarksMandatory')
    String? remarksMandatory,
    @JsonKey(name: 'MinimumCredits')
    dynamic minimumCredits,
    @JsonKey(name: 'MinimumSaleAmount')
    dynamic minimumSaleAmount,
    @JsonKey(name: 'CouponMandatory')
    String? couponMandatory,
    @JsonKey(name: 'DiscountType')
    String? discountType,
    @JsonKey(name: 'ApplicationLimit')
    dynamic applicationLimit,
    @JsonKey(name: 'AutomaticApply')
    String? automaticApply,
    @JsonKey(name: 'DisplayInPOS')
    String? displayInPos,
    @JsonKey(name: 'AllowMultipleApplication')
    bool? allowMultipleApplication,
    @JsonKey(name: 'TransactionProfileId')
    int? transactionProfileId,
    @JsonKey(name: 'VariableDiscounts')
    String? variableDiscounts,
    @JsonKey(name: 'DiscountCriteriaLines')
    bool? discountCriteriaLines,
    @JsonKey(name: 'ScheduleId')
    int? scheduleId,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'DiscountPurchaseCriteriaCount')
    int? discountPurchaseCriteriaCount,
    @JsonKey(name: 'DiscountPurchaseCriteriaQuantityCount ')
    int? discountPurchaseCriteriaQuantityCount,
    @JsonKey(name: 'DiscountPurchaseCriteriaValidityQuantityCount')
    int? discountPurchaseCriteriaValidityQuantityCount,
    @JsonKey(name: 'OverridingDiscountAmountExists')
    bool? overridingDiscountAmountExists,
    @JsonKey(name: 'OverridingDiscountedPriceExists')
    bool? overridingDiscountedPriceExists,
    @JsonKey(name: 'OverridingDiscountPercentageExists')
    bool? overridingDiscountPercentageExists,
    @JsonKey(name: 'SortOrder')
    int? sortOrder,
    @JsonKey(name: 'TransactionDiscountType')
    String? transactionDiscountType,
    @JsonKey(name: 'AllProductsAreDiscounted')
    bool? allProductsAreDiscounted,
    @JsonKey(name: 'DiscountPurchaseCriteriaContainerDTOList')
    required List<DiscountPurchaseCriteriaDto> discountPurchaseCriteriaContainerDtoList,
    @JsonKey(name: 'DiscountedProductsContainerDTOList')
    required List<DiscountedProductsContainerDto> discountedProductsContainerDtoList,
    @JsonKey(name: 'DiscountedGamesContainerDTOList')
    required List<dynamic> discountedGamesContainerDtoList,



  }) = _DiscountContainerDto;

  factory DiscountContainerDto.fromJson(Map<String, dynamic> json) => _$DiscountContainerDtoFromJson(json);
}