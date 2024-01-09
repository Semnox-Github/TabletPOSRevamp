// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductPriceContainerData _$$_ProductPriceContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_ProductPriceContainerData(
      finalPrice: (json['FinalPrice'] as num).toDouble(),
      basePrice: (json['BasePrice'] as num).toDouble(),
      userRolePrice: json['UserRolePrice'],
      memberShipPrice: json['MemberShipPrice'],
      transactionProfilePrice: json['TransactionProfilePrice'],
      promotionPrice: json['PromotionPrice'],
      priceType: json['PriceType'] as String,
      tickets: (json['Tickets'] as num).toDouble(),
      faceValue: (json['FaceValue'] as num).toDouble(),
      displayGroup: json['DisplayGroup'] as String,
      vipCard: json['VipCard'] as String,
      ticketAllowed: json['TicketAllowed'] as String,
      taxInclusivePrice: json['TaxInclusivePrice'] as String,
      inventoryProductCode: json['InventoryProductCode'] as String,
      expiryDate: json['ExpiryDate'] as String,
      autoCheckOut: json['AutoCheckOut'] as String,
      checkInFacilityId: json['CheckInFacilityId'] as int,
      maxCheckOutAmount: (json['MaxCheckOutAmount'] as num).toDouble(),
      customDataSetId: json['CustomDataSetId'] as int,
      cardTypeId: json['CardTypeId'] as int,
      overridePrintTemplateId: json['OverridePrintTemplateId'] as int,
      startDate: json['StartDate'] as String,
      buttonColor: json['ButtonColor'] as String,
      minimumUserPrice: (json['MinimumUserPrice'] as num).toDouble(),
      textColor: json['TextColor'] as String,
      font: json['Font'] as String,
      modifier: json['Modifier'] as String,
      emailTemplateId: json['EmailTemplateId'] as int,
      maximumTime: json['MaximumTime'] as int,
      minimumTime: json['MinimumTime'] as int,
      cardValidFor: json['CardValidFor'] as int,
      additionalPrice: (json['AdditionalPrice'] as num).toDouble(),
      additionalTaxInclusive: json['AdditionalTaxInclusive'] as String,
      additionalTaxId: json['AdditionalTaxId'] as int,
      segmentCategoryId: json['SegmentCategoryId'] as int,
      cardExpiryDate: json['CardExpiryDate'] as String,
      productDisplayGroupFormatId: json['ProductDisplayGroupFormatId'] as int,
      enableVariableLockerHours: json['EnableVariableLockerHours'] as bool,
      categoryName: json['CategoryName'] as String?,
      licenseType: json['LicenseType'] as String,
      cardSale: json['CardSale'] as String,
      zoneCode: json['ZoneCode'] as String,
      lockerMode: json['LockerMode'] as String,
      taxName: json['TaxName'] as String,
      usedInDiscounts: json['UsedInDiscounts'],
      creditPlusConsumptionId: json['CreditPlusConsumptionId'],
      mapedDisplayGroup: json['MapedDisplayGroup'],
      linkChildCard: json['LinkChildCard'] as bool,
      zoneId: json['ZoneId'] as int,
      lockerExpiryInHours: (json['LockerExpiryInHours'] as num).toDouble(),
      lockerExpiryDate: json['LockerExpiryDate'] as String,
      hsnSacCode: json['HsnSacCode'] as String,
      membershipId: json['MembershipId'],
      isSellable: json['IsSellable'] as bool,
      serviceCharge: json['ServiceCharge'],
      packingCharge: json['PackingCharge'],
      productId: json['ProductId'] as int,
      productName: json['ProductName'] as String,
      productType: json['ProductType'] as String,
      description: json['Description'] as String,
      productTypeId: json['ProductTypeId'] as int,
      categoryId: json['CategoryId'] as int,
      price: (json['Price'] as num).toDouble(),
      sortOrder: (json['SortOrder'] as num).toDouble(),
      siteId: json['SiteId'] as int,
      autoGenerateCardNumber: json['AutoGenerateCardNumber'] as String,
      quantityPrompt: json['QuantityPrompt'] as String,
      trxRemarksMandatory: json['TrxRemarksMandatory'] as String,
      onlyForVip: json['OnlyForVIP'] as String?,
      allowPriceOverride: json['AllowPriceOverride'] as String,
      registeredCustomerOnly: json['RegisteredCustomerOnly'] as String,
      managerApprovalRequired: json['ManagerApprovalRequired'] as String,
      verifiedCustomerOnly: json['VerifiedCustomerOnly'] as String,
      externalSystemReference: json['ExternalSystemReference'] as String,
      minimumQuantity: json['MinimumQuantity'] as int,
      cardCount: json['CardCount'] as int,
      trxHeaderRemarksMandatory: json['TrxHeaderRemarksMandatory'] as bool,
      imageFileName: json['ImageFileName'] as String,
      advancePercentage: (json['AdvancePercentage'] as num).toDouble(),
      advanceAmount: (json['AdvanceAmount'] as num).toDouble(),
      waiverRequired: json['WaiverRequired'] as String,
      invokeCustomerRegistration: json['InvokeCustomerRegistration'] as bool,
      displayInPos: json['DisplayInPOS'] as String?,
      taxId: json['TaxId'] as int,
      taxPercentage: (json['TaxPercentage'] as num).toDouble(),
      waiverSetId: json['WaiverSetId'] as int,
      loadToSingleCard: json['LoadToSingleCard'] as bool,
      isGroupMeal: json['IsGroupMeal'] as String,
      isSystemProduct: json['IsSystemProduct'] as bool,
      isActive: json['IsActive'] as bool,
      posTypeId: json['POSTypeId'] as int,
      notificationTagProfileId: json['NotificationTagProfileId'] as int,
      issueNotificationDevice: json['IssueNotificationDevice'],
      isRecommended: json['IsRecommended'] as bool,
      searchDescription: json['SearchDescription'] as String,
      maxQtyPerDay: json['MaxQtyPerDay'],
      availableUnits: json['AvailableUnits'] as int,
      webDescription: json['WebDescription'] as String,
      translatedProductName: json['TranslatedProductName'] as String,
      translatedProductDescription:
          json['TranslatedProductDescription'] as String,
      guid: json['Guid'] as String,
      comboProductContainerDTOList:
          (json['ComboProductContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  ComboProductContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      productModifierContainerDTOList: (json['ProductModifierContainerDTOList']
              as List<dynamic>)
          .map((e) =>
              ProductModifierContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      productsDisplayGroupContainerDTOList:
          (json['ProductsDisplayGroupContainerDTOList'] as List<dynamic>?)
              ?.map((e) => ProductsDisplayGroupContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      productGamesContainerDTOList:
          (json['ProductGamesContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  ProductGamesContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      productCreditPlusContainerDTOList:
          (json['ProductCreditPlusContainerDTOList'] as List<dynamic>)
              .map((e) => ProductCreditPlusContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      productDiscountContainerDTOList: (json['ProductDiscountContainerDTOList']
              as List<dynamic>)
          .map((e) =>
              ProductDiscountContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerProfilingGroupContainerDTO:
          CustomerProfilingGroupContainerDTO.fromJson(
              json['CustomerProfilingGroupContainerDTO']
                  as Map<String, dynamic>),
      inventoryItemContainerDTO: json['InventoryItemContainerDTO'] == null
          ? null
          : InventoryItemContainerDTO.fromJson(
              json['InventoryItemContainerDTO'] as Map<String, dynamic>),
      productSubscriptionContainerDTO: json['ProductSubscriptionContainerDTO'],
      upsellOffersContainerDTOList:
          (json['UpsellOffersContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  UpsellOffersContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      crossSellProductsContainerDTOList:
          (json['CrossSellProductsContainerDTOList'] as List<dynamic>)
              .map((e) => CrossSellProductsContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      customDataContainerDTOList: (json['CustomDataContainerDTOList']
              as List<dynamic>)
          .map(
              (e) => CustomDataContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: json['StartTime'] as String,
      expiryTime: json['ExpiryTime'] as String,
      orderTypeId: json['OrderTypeId'] as int,
      credits: (json['Credits'] as num).toDouble(),
      courtesy: (json['Courtesy'] as num).toDouble(),
      bonus: (json['Bonus'] as num).toDouble(),
      time: (json['Time'] as num).toDouble(),
      serviceChargeIsApplicable: json['ServiceChargeIsApplicable'] as bool,
      serviceChargePercentage: json['ServiceChargePercentage'],
      maximumQuantity: json['MaximumQuantity'],
      pauseType: json['PauseType'] as int,
      customerProfilingGroupId: json['CustomerProfilingGroupId'] as int,
      ageUpperLimit: (json['AgeUpperLimit'] as num).toDouble(),
      ageLowerLimit: (json['AgeLowerLimit'] as num).toDouble(),
      gratuityIsApplicable: json['GratuityIsApplicable'] as bool,
      gratuityPercentage: json['GratuityPercentage'],
    );

Map<String, dynamic> _$$_ProductPriceContainerDataToJson(
        _$_ProductPriceContainerData instance) =>
    <String, dynamic>{
      'FinalPrice': instance.finalPrice,
      'BasePrice': instance.basePrice,
      'UserRolePrice': instance.userRolePrice,
      'MemberShipPrice': instance.memberShipPrice,
      'TransactionProfilePrice': instance.transactionProfilePrice,
      'PromotionPrice': instance.promotionPrice,
      'PriceType': instance.priceType,
      'Tickets': instance.tickets,
      'FaceValue': instance.faceValue,
      'DisplayGroup': instance.displayGroup,
      'VipCard': instance.vipCard,
      'TicketAllowed': instance.ticketAllowed,
      'TaxInclusivePrice': instance.taxInclusivePrice,
      'InventoryProductCode': instance.inventoryProductCode,
      'ExpiryDate': instance.expiryDate,
      'AutoCheckOut': instance.autoCheckOut,
      'CheckInFacilityId': instance.checkInFacilityId,
      'MaxCheckOutAmount': instance.maxCheckOutAmount,
      'CustomDataSetId': instance.customDataSetId,
      'CardTypeId': instance.cardTypeId,
      'OverridePrintTemplateId': instance.overridePrintTemplateId,
      'StartDate': instance.startDate,
      'ButtonColor': instance.buttonColor,
      'MinimumUserPrice': instance.minimumUserPrice,
      'TextColor': instance.textColor,
      'Font': instance.font,
      'Modifier': instance.modifier,
      'EmailTemplateId': instance.emailTemplateId,
      'MaximumTime': instance.maximumTime,
      'MinimumTime': instance.minimumTime,
      'CardValidFor': instance.cardValidFor,
      'AdditionalPrice': instance.additionalPrice,
      'AdditionalTaxInclusive': instance.additionalTaxInclusive,
      'AdditionalTaxId': instance.additionalTaxId,
      'SegmentCategoryId': instance.segmentCategoryId,
      'CardExpiryDate': instance.cardExpiryDate,
      'ProductDisplayGroupFormatId': instance.productDisplayGroupFormatId,
      'EnableVariableLockerHours': instance.enableVariableLockerHours,
      'CategoryName': instance.categoryName,
      'LicenseType': instance.licenseType,
      'CardSale': instance.cardSale,
      'ZoneCode': instance.zoneCode,
      'LockerMode': instance.lockerMode,
      'TaxName': instance.taxName,
      'UsedInDiscounts': instance.usedInDiscounts,
      'CreditPlusConsumptionId': instance.creditPlusConsumptionId,
      'MapedDisplayGroup': instance.mapedDisplayGroup,
      'LinkChildCard': instance.linkChildCard,
      'ZoneId': instance.zoneId,
      'LockerExpiryInHours': instance.lockerExpiryInHours,
      'LockerExpiryDate': instance.lockerExpiryDate,
      'HsnSacCode': instance.hsnSacCode,
      'MembershipId': instance.membershipId,
      'IsSellable': instance.isSellable,
      'ServiceCharge': instance.serviceCharge,
      'PackingCharge': instance.packingCharge,
      'ProductId': instance.productId,
      'ProductName': instance.productName,
      'ProductType': instance.productType,
      'Description': instance.description,
      'ProductTypeId': instance.productTypeId,
      'CategoryId': instance.categoryId,
      'Price': instance.price,
      'SortOrder': instance.sortOrder,
      'SiteId': instance.siteId,
      'AutoGenerateCardNumber': instance.autoGenerateCardNumber,
      'QuantityPrompt': instance.quantityPrompt,
      'TrxRemarksMandatory': instance.trxRemarksMandatory,
      'OnlyForVIP': instance.onlyForVip,
      'AllowPriceOverride': instance.allowPriceOverride,
      'RegisteredCustomerOnly': instance.registeredCustomerOnly,
      'ManagerApprovalRequired': instance.managerApprovalRequired,
      'VerifiedCustomerOnly': instance.verifiedCustomerOnly,
      'ExternalSystemReference': instance.externalSystemReference,
      'MinimumQuantity': instance.minimumQuantity,
      'CardCount': instance.cardCount,
      'TrxHeaderRemarksMandatory': instance.trxHeaderRemarksMandatory,
      'ImageFileName': instance.imageFileName,
      'AdvancePercentage': instance.advancePercentage,
      'AdvanceAmount': instance.advanceAmount,
      'WaiverRequired': instance.waiverRequired,
      'InvokeCustomerRegistration': instance.invokeCustomerRegistration,
      'DisplayInPOS': instance.displayInPos,
      'TaxId': instance.taxId,
      'TaxPercentage': instance.taxPercentage,
      'WaiverSetId': instance.waiverSetId,
      'LoadToSingleCard': instance.loadToSingleCard,
      'IsGroupMeal': instance.isGroupMeal,
      'IsSystemProduct': instance.isSystemProduct,
      'IsActive': instance.isActive,
      'POSTypeId': instance.posTypeId,
      'NotificationTagProfileId': instance.notificationTagProfileId,
      'IssueNotificationDevice': instance.issueNotificationDevice,
      'IsRecommended': instance.isRecommended,
      'SearchDescription': instance.searchDescription,
      'MaxQtyPerDay': instance.maxQtyPerDay,
      'AvailableUnits': instance.availableUnits,
      'WebDescription': instance.webDescription,
      'TranslatedProductName': instance.translatedProductName,
      'TranslatedProductDescription': instance.translatedProductDescription,
      'Guid': instance.guid,
      'ComboProductContainerDTOList': instance.comboProductContainerDTOList,
      'ProductModifierContainerDTOList':
          instance.productModifierContainerDTOList,
      'ProductsDisplayGroupContainerDTOList':
          instance.productsDisplayGroupContainerDTOList,
      'ProductGamesContainerDTOList': instance.productGamesContainerDTOList,
      'ProductCreditPlusContainerDTOList':
          instance.productCreditPlusContainerDTOList,
      'ProductDiscountContainerDTOList':
          instance.productDiscountContainerDTOList,
      'CustomerProfilingGroupContainerDTO':
          instance.customerProfilingGroupContainerDTO,
      'InventoryItemContainerDTO': instance.inventoryItemContainerDTO,
      'ProductSubscriptionContainerDTO':
          instance.productSubscriptionContainerDTO,
      'UpsellOffersContainerDTOList': instance.upsellOffersContainerDTOList,
      'CrossSellProductsContainerDTOList':
          instance.crossSellProductsContainerDTOList,
      'CustomDataContainerDTOList': instance.customDataContainerDTOList,
      'StartTime': instance.startTime,
      'ExpiryTime': instance.expiryTime,
      'OrderTypeId': instance.orderTypeId,
      'Credits': instance.credits,
      'Courtesy': instance.courtesy,
      'Bonus': instance.bonus,
      'Time': instance.time,
      'ServiceChargeIsApplicable': instance.serviceChargeIsApplicable,
      'ServiceChargePercentage': instance.serviceChargePercentage,
      'MaximumQuantity': instance.maximumQuantity,
      'PauseType': instance.pauseType,
      'CustomerProfilingGroupId': instance.customerProfilingGroupId,
      'AgeUpperLimit': instance.ageUpperLimit,
      'AgeLowerLimit': instance.ageLowerLimit,
      'GratuityIsApplicable': instance.gratuityIsApplicable,
      'GratuityPercentage': instance.gratuityPercentage,
    };
