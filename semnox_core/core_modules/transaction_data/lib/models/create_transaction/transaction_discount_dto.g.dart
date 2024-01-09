// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_discount_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDiscountDto _$$_TransactionDiscountDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionDiscountDto(
      transactionDiscountId: json['TransactionDiscountId'] as int?,
      transactionId: json['TransactionId'] as int?,
      discountId: json['DiscountId'] as int?,
      discountName: json['DiscountName'] as String?,
      discountAmount: json['DiscountAmount'],
      discountPercentage: json['DiscountPercentage'],
      approvedBy: json['ApprovedBy'] as int?,
      remarks: json['Remarks'] as String?,
      applicationType: json['ApplicationType'] as String?,
      applicationCardId: json['ApplicationCardId'] as int?,
      discountType: json['DiscountType'] as String?,
      couponNumber: json['CouponNumber'] as String?,
      indicator: json['Indicator'] as String?,
      isActive: json['IsActive'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      guid: json['Guid'] as String?,
      siteId: json['SiteId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      masterEntityId: json['MasterEntityId'] as int?,
      transactionDiscountCriteriaLineDTOList:
          json['TransactionDiscountCriteriaLineDTOList'] as List<dynamic>?,
      transactionDiscountApplicableLineDTOList:
          (json['TransactionDiscountApplicableLineDTOList'] as List<dynamic>?)
              ?.map((e) => TransactionDiscountApplicableLineDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      isChanged: json['IsChanged'] as bool?,
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_TransactionDiscountDtoToJson(
        _$_TransactionDiscountDto instance) =>
    <String, dynamic>{
      'TransactionDiscountId': instance.transactionDiscountId,
      'TransactionId': instance.transactionId,
      'DiscountId': instance.discountId,
      'DiscountName': instance.discountName,
      'DiscountAmount': instance.discountAmount,
      'DiscountPercentage': instance.discountPercentage,
      'ApprovedBy': instance.approvedBy,
      'Remarks': instance.remarks,
      'ApplicationType': instance.applicationType,
      'ApplicationCardId': instance.applicationCardId,
      'DiscountType': instance.discountType,
      'CouponNumber': instance.couponNumber,
      'Indicator': instance.indicator,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'TransactionDiscountCriteriaLineDTOList':
          instance.transactionDiscountCriteriaLineDTOList,
      'TransactionDiscountApplicableLineDTOList':
          instance.transactionDiscountApplicableLineDTOList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
