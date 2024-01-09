// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountContainerDto _$$_DiscountContainerDtoFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountContainerDto(
      discountContainerDtoListAutomaticApply: json['automaticApply'] as String?,
      discountContainerDtoListApplicationLimit: json['applicationLimit'],
      discountId: json['DiscountId'] as int?,
      discountName: json['DiscountName'] as String?,
      discountPercentage: json['DiscountPercentage'],
      discountAmount: json['DiscountAmount'],
      managerApprovalRequired: json['ManagerApprovalRequired'] as String?,
      remarksMandatory: json['RemarksMandatory'] as String?,
      minimumCredits: json['MinimumCredits'],
      minimumSaleAmount: json['MinimumSaleAmount'],
      couponMandatory: json['CouponMandatory'] as String?,
      discountType: json['DiscountType'] as String?,
      applicationLimit: json['ApplicationLimit'],
      automaticApply: json['AutomaticApply'] as String?,
      displayInPos: json['DisplayInPOS'] as String?,
      allowMultipleApplication: json['AllowMultipleApplication'] as bool?,
      transactionProfileId: json['TransactionProfileId'] as int?,
      variableDiscounts: json['VariableDiscounts'] as String?,
      discountCriteriaLines: json['DiscountCriteriaLines'] as bool?,
      scheduleId: json['ScheduleId'] as int?,
      isActive: json['IsActive'] as bool?,
      discountPurchaseCriteriaCount:
          json['DiscountPurchaseCriteriaCount'] as int?,
      discountPurchaseCriteriaQuantityCount:
          json['DiscountPurchaseCriteriaQuantityCount '] as int?,
      discountPurchaseCriteriaValidityQuantityCount:
          json['DiscountPurchaseCriteriaValidityQuantityCount'] as int?,
      overridingDiscountAmountExists:
          json['OverridingDiscountAmountExists'] as bool?,
      overridingDiscountedPriceExists:
          json['OverridingDiscountedPriceExists'] as bool?,
      overridingDiscountPercentageExists:
          json['OverridingDiscountPercentageExists'] as bool?,
      sortOrder: json['SortOrder'] as int?,
      transactionDiscountType: json['TransactionDiscountType'] as String?,
      allProductsAreDiscounted: json['AllProductsAreDiscounted'] as bool?,
      discountPurchaseCriteriaContainerDtoList:
          (json['DiscountPurchaseCriteriaContainerDTOList'] as List<dynamic>)
              .map((e) => DiscountPurchaseCriteriaDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      discountedProductsContainerDtoList:
          (json['DiscountedProductsContainerDTOList'] as List<dynamic>)
              .map((e) => DiscountedProductsContainerDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      discountedGamesContainerDtoList:
          json['DiscountedGamesContainerDTOList'] as List<dynamic>,
    );

Map<String, dynamic> _$$_DiscountContainerDtoToJson(
        _$_DiscountContainerDto instance) =>
    <String, dynamic>{
      'automaticApply': instance.discountContainerDtoListAutomaticApply,
      'applicationLimit': instance.discountContainerDtoListApplicationLimit,
      'DiscountId': instance.discountId,
      'DiscountName': instance.discountName,
      'DiscountPercentage': instance.discountPercentage,
      'DiscountAmount': instance.discountAmount,
      'ManagerApprovalRequired': instance.managerApprovalRequired,
      'RemarksMandatory': instance.remarksMandatory,
      'MinimumCredits': instance.minimumCredits,
      'MinimumSaleAmount': instance.minimumSaleAmount,
      'CouponMandatory': instance.couponMandatory,
      'DiscountType': instance.discountType,
      'ApplicationLimit': instance.applicationLimit,
      'AutomaticApply': instance.automaticApply,
      'DisplayInPOS': instance.displayInPos,
      'AllowMultipleApplication': instance.allowMultipleApplication,
      'TransactionProfileId': instance.transactionProfileId,
      'VariableDiscounts': instance.variableDiscounts,
      'DiscountCriteriaLines': instance.discountCriteriaLines,
      'ScheduleId': instance.scheduleId,
      'IsActive': instance.isActive,
      'DiscountPurchaseCriteriaCount': instance.discountPurchaseCriteriaCount,
      'DiscountPurchaseCriteriaQuantityCount ':
          instance.discountPurchaseCriteriaQuantityCount,
      'DiscountPurchaseCriteriaValidityQuantityCount':
          instance.discountPurchaseCriteriaValidityQuantityCount,
      'OverridingDiscountAmountExists': instance.overridingDiscountAmountExists,
      'OverridingDiscountedPriceExists':
          instance.overridingDiscountedPriceExists,
      'OverridingDiscountPercentageExists':
          instance.overridingDiscountPercentageExists,
      'SortOrder': instance.sortOrder,
      'TransactionDiscountType': instance.transactionDiscountType,
      'AllProductsAreDiscounted': instance.allProductsAreDiscounted,
      'DiscountPurchaseCriteriaContainerDTOList':
          instance.discountPurchaseCriteriaContainerDtoList,
      'DiscountedProductsContainerDTOList':
          instance.discountedProductsContainerDtoList,
      'DiscountedGamesContainerDTOList':
          instance.discountedGamesContainerDtoList,
    };
