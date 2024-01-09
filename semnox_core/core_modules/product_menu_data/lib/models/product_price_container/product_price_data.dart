// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_price_container/combo_product_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/custom_data_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/customer_profiling_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/inventory_item_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_credit_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_discount_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_display_group_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_games_container_dto.dart';

import 'package:product_menu_data/models/product_price_container/product_modifier_container_dto.dart';
import 'package:product_menu_data/models/products_container/cross_sell_product_dto.dart';
import 'package:product_menu_data/models/products_container/upsell_offer_dto.dart';

part 'product_price_data.freezed.dart';
part 'product_price_data.g.dart';

@freezed
class ProductPriceContainerData with _$ProductPriceContainerData {
  const factory ProductPriceContainerData({
    @JsonKey(name: 'FinalPrice')
    required double finalPrice,
    @JsonKey(name: 'BasePrice')
    required double basePrice,
    @JsonKey(name: 'UserRolePrice')
    dynamic userRolePrice,
    @JsonKey(name: 'MemberShipPrice')
    dynamic memberShipPrice,
    @JsonKey(name: 'TransactionProfilePrice')
    dynamic transactionProfilePrice,
    @JsonKey(name: 'PromotionPrice')
    dynamic promotionPrice,
    @JsonKey(name: 'PriceType')
    required String priceType,
    @JsonKey(name: 'Tickets')
    required double tickets,
    @JsonKey(name: 'FaceValue')
    required double faceValue,
    @JsonKey(name: 'DisplayGroup')
    required String displayGroup,
    @JsonKey(name: 'VipCard')
    required String vipCard,
    @JsonKey(name: 'TicketAllowed')
    required String ticketAllowed,
    @JsonKey(name: 'TaxInclusivePrice')
    required String taxInclusivePrice,
    @JsonKey(name: 'InventoryProductCode')
    required String inventoryProductCode,
    @JsonKey(name: 'ExpiryDate')
    required String expiryDate,
    @JsonKey(name: 'AutoCheckOut')
    required String autoCheckOut,
    @JsonKey(name: 'CheckInFacilityId')
    required int checkInFacilityId,
    @JsonKey(name: 'MaxCheckOutAmount')
    required double maxCheckOutAmount,
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'CardTypeId')
    required int cardTypeId,
    @JsonKey(name: 'OverridePrintTemplateId')
    required int overridePrintTemplateId,
    @JsonKey(name: 'StartDate')
    required String startDate,
    @JsonKey(name: 'ButtonColor')
    required String buttonColor,
    @JsonKey(name: 'MinimumUserPrice')
    required double minimumUserPrice,
    @JsonKey(name: 'TextColor')
    required String textColor,
    @JsonKey(name: 'Font')
    required String font,
    @JsonKey(name: 'Modifier')
    required String modifier,
    @JsonKey(name: 'EmailTemplateId')
    required int emailTemplateId,
    @JsonKey(name: 'MaximumTime')
    required int maximumTime,
    @JsonKey(name: 'MinimumTime')
    required int minimumTime,
    @JsonKey(name: 'CardValidFor')
    required int cardValidFor,
    @JsonKey(name: 'AdditionalPrice')
    required double additionalPrice,
    @JsonKey(name: 'AdditionalTaxInclusive')
    required String additionalTaxInclusive,
    @JsonKey(name: 'AdditionalTaxId')
    required int additionalTaxId,
    @JsonKey(name: 'SegmentCategoryId')
    required int segmentCategoryId,
    @JsonKey(name: 'CardExpiryDate')
    required String cardExpiryDate,
    @JsonKey(name: 'ProductDisplayGroupFormatId')
    required int productDisplayGroupFormatId,
    @JsonKey(name: 'EnableVariableLockerHours')
    required bool enableVariableLockerHours,
    @JsonKey(name: 'CategoryName')
    String? categoryName,
    @JsonKey(name: 'LicenseType')
    required String licenseType,
    @JsonKey(name: 'CardSale')
    required String cardSale,
    @JsonKey(name: 'ZoneCode')
    required String zoneCode,
    @JsonKey(name: 'LockerMode')
    required String lockerMode,
    @JsonKey(name: 'TaxName')
    required String taxName,
    @JsonKey(name: 'UsedInDiscounts')
    dynamic usedInDiscounts,
    @JsonKey(name: 'CreditPlusConsumptionId')
    dynamic creditPlusConsumptionId,
    @JsonKey(name: 'MapedDisplayGroup')
    dynamic mapedDisplayGroup,
    @JsonKey(name: 'LinkChildCard')
    required bool linkChildCard,
    @JsonKey(name: 'ZoneId')
    required int zoneId,
    @JsonKey(name: 'LockerExpiryInHours')
    required double lockerExpiryInHours,
    @JsonKey(name: 'LockerExpiryDate')
    required String lockerExpiryDate,
    @JsonKey(name: 'HsnSacCode')
    required String hsnSacCode,
    @JsonKey(name: 'MembershipId')
    dynamic membershipId,
    @JsonKey(name: 'IsSellable')
    required bool isSellable,
    @JsonKey(name: 'ServiceCharge')
    dynamic serviceCharge,
    @JsonKey(name: 'PackingCharge')
    dynamic packingCharge,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'ProductName')
    required String productName,
    @JsonKey(name: 'ProductType')
    required String productType,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'ProductTypeId')
    required int productTypeId,
    @JsonKey(name: 'CategoryId')
    required int categoryId,
    @JsonKey(name: 'Price')
    required double price,
    @JsonKey(name: 'SortOrder')
    required double sortOrder,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'AutoGenerateCardNumber')
    required String autoGenerateCardNumber,
    @JsonKey(name: 'QuantityPrompt')
    required String quantityPrompt,
    @JsonKey(name: 'TrxRemarksMandatory')
    required String trxRemarksMandatory,
    @JsonKey(name: 'OnlyForVIP')
    String? onlyForVip,
    @JsonKey(name: 'AllowPriceOverride')
    required String allowPriceOverride,
    @JsonKey(name: 'RegisteredCustomerOnly')
    required String registeredCustomerOnly,
    @JsonKey(name: 'ManagerApprovalRequired')
    required String managerApprovalRequired,
    @JsonKey(name: 'VerifiedCustomerOnly')
    required String verifiedCustomerOnly,
    @JsonKey(name: 'ExternalSystemReference')
    required String externalSystemReference,
    @JsonKey(name: 'MinimumQuantity')
    required int minimumQuantity,
    @JsonKey(name: 'CardCount')
    required int cardCount,
    @JsonKey(name: 'TrxHeaderRemarksMandatory')
    required bool trxHeaderRemarksMandatory,
    @JsonKey(name: 'ImageFileName')
    required String imageFileName,
    @JsonKey(name: 'AdvancePercentage')
    required double advancePercentage,
    @JsonKey(name: 'AdvanceAmount')
    required double advanceAmount,
    @JsonKey(name: 'WaiverRequired')
    required String waiverRequired,
    @JsonKey(name: 'InvokeCustomerRegistration')
    required bool invokeCustomerRegistration,
    @JsonKey(name: 'DisplayInPOS')
    String? displayInPos,
    @JsonKey(name: 'TaxId')
    required int taxId,
    @JsonKey(name: 'TaxPercentage')
    required double taxPercentage,
    @JsonKey(name: 'WaiverSetId')
    required int waiverSetId,
    @JsonKey(name: 'LoadToSingleCard')
    required bool loadToSingleCard,
    @JsonKey(name: 'IsGroupMeal')
    required String isGroupMeal,
    @JsonKey(name: 'IsSystemProduct')
    required bool isSystemProduct,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'POSTypeId')
    required int posTypeId,
    @JsonKey(name: 'NotificationTagProfileId')
    required int notificationTagProfileId,
    @JsonKey(name: 'IssueNotificationDevice')
    dynamic issueNotificationDevice,
    @JsonKey(name: 'IsRecommended')
    required bool isRecommended,
    @JsonKey(name: 'SearchDescription')
    required String searchDescription,
    @JsonKey(name: 'MaxQtyPerDay')
    dynamic maxQtyPerDay,
    @JsonKey(name: 'AvailableUnits')
    required int availableUnits,
    @JsonKey(name: 'WebDescription')
    required String webDescription,
    @JsonKey(name: 'TranslatedProductName')
    required String translatedProductName,
    @JsonKey(name: 'TranslatedProductDescription')
    required String translatedProductDescription,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'ComboProductContainerDTOList')
    required List<ComboProductContainerDTO> comboProductContainerDTOList,
    @JsonKey(name: 'ProductModifierContainerDTOList')
    required List<ProductModifierContainerDTO> productModifierContainerDTOList,
    @JsonKey(name: 'ProductsDisplayGroupContainerDTOList')
    List<ProductsDisplayGroupContainerDTO>? productsDisplayGroupContainerDTOList,
    @JsonKey(name: 'ProductGamesContainerDTOList')
    required List<ProductGamesContainerDTO> productGamesContainerDTOList,
    @JsonKey(name: 'ProductCreditPlusContainerDTOList')
    required List<ProductCreditPlusContainerDTO> productCreditPlusContainerDTOList,
    @JsonKey(name: 'ProductDiscountContainerDTOList')
    required List<ProductDiscountContainerDTO> productDiscountContainerDTOList,
    @JsonKey(name: 'CustomerProfilingGroupContainerDTO')
    required CustomerProfilingGroupContainerDTO customerProfilingGroupContainerDTO,
    @JsonKey(name: 'InventoryItemContainerDTO')
    InventoryItemContainerDTO? inventoryItemContainerDTO,
    @JsonKey(name: 'ProductSubscriptionContainerDTO')
    dynamic productSubscriptionContainerDTO,
    @JsonKey(name: 'UpsellOffersContainerDTOList')
    required List<UpsellOffersContainerDTO> upsellOffersContainerDTOList,
    @JsonKey(name: 'CrossSellProductsContainerDTOList')
    required List<CrossSellProductsContainerDTO> crossSellProductsContainerDTOList,
    @JsonKey(name: 'CustomDataContainerDTOList')
    required List<CustomDataContainerDTO> customDataContainerDTOList,
    @JsonKey(name: 'StartTime')
    required String startTime,
    @JsonKey(name: 'ExpiryTime')
    required String expiryTime,
    @JsonKey(name: 'OrderTypeId')
    required int orderTypeId,
    @JsonKey(name: 'Credits')
    required double credits,
    @JsonKey(name: 'Courtesy')
    required double courtesy,
    @JsonKey(name: 'Bonus')
    required double bonus,
    @JsonKey(name: 'Time')
    required double time,
    @JsonKey(name: 'ServiceChargeIsApplicable')
    required bool serviceChargeIsApplicable,
    @JsonKey(name: 'ServiceChargePercentage')
    dynamic serviceChargePercentage,
    @JsonKey(name: 'MaximumQuantity')
    dynamic maximumQuantity,
    @JsonKey(name: 'PauseType')
    required int pauseType,
    @JsonKey(name: 'CustomerProfilingGroupId')
    required int customerProfilingGroupId,
    @JsonKey(name: 'AgeUpperLimit')
    required double ageUpperLimit,
    @JsonKey(name: 'AgeLowerLimit')
    required double ageLowerLimit,
    @JsonKey(name: 'GratuityIsApplicable')
    required bool gratuityIsApplicable,
    @JsonKey(name: 'GratuityPercentage')
    dynamic gratuityPercentage,
  }) = _ProductPriceContainerData;

  factory ProductPriceContainerData.fromJson(Map<String, dynamic> json) => _$ProductPriceContainerDataFromJson(json);
}