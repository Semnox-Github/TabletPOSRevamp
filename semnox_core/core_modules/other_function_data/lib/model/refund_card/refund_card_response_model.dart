// To parse this JSON data, do
//
//     final refundCardsResponsetModel = refundCardsResponsetModelFromJson(jsonString);

import 'dart:convert';

RefundCardsResponsetModel refundCardsResponsetModelFromJson(String str) =>
    RefundCardsResponsetModel.fromJson(json.decode(str));

String refundCardsResponsetModelToJson(RefundCardsResponsetModel data) =>
    json.encode(data.toJson());

class RefundCardsResponsetModel {
  Data? data;

  RefundCardsResponsetModel({
    this.data,
  });

  factory RefundCardsResponsetModel.fromJson(Map<String, dynamic> json) =>
      RefundCardsResponsetModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? transactionId;
  int? approvedBy;
  int? transactionReopenedCount;
  DateTime? transactionInitiatedTime;
  dynamic transactionClosedTime;
  dynamic transactionCancelledTime;
  dynamic transactionReopenedTime;
  int? sessionId;
  String? tentNumber;
  String? guestContactEmail;
  String? lockStatus;
  int? lockedByPosMachineId;
  int? lockedBySiteId;
  int? lockedByUserId;
  dynamic lockedTime;
  bool? processedForLoyalty;
  int? transactionTypeId;
  bool? isActive;
  String? transactionPaymentStatus;
  int? transactionPaymentStatusId;
  DateTime? transactionPaymentStatusChangeDate;
  bool? isNonChargeable;
  int? guestCount;
  String? guestContactNumber;
  String? guestName;
  String? transactionIdentifier;
  dynamic transactionTaxTotal;
  String? channel;
  dynamic transactionPaymentTotal;
  DateTime? transactionDate;
  dynamic transactionAmount;
  dynamic transactionNetAmount;
  int? userId;
  int? primaryCardId;
  int? orderId;
  int? posTypeId;
  String? transactionNumber;
  String? transactionOtp;
  String? remarks;
  int? posMachineId;
  String? posMachine;
  String? status;
  String? transactionStatus;
  int? transactionStatusId;
  DateTime? transactionStatusChangeDate;
  int? transactionProfileId;
  String? transactionProfileName;
  DateTime? lastUpdateDate;
  String? lastUpdatedBy;
  dynamic tokenNumber;
  String? originalSystemReference;
  int? customerId;
  String? externalSystemReference;
  int? reprintCount;
  int? originalTransactionId;
  int? orderTypeGroupId;
  int? provisionalBillPrintCount;
  int? printCount;
  dynamic saveStartTime;
  dynamic saveEndTime;
  dynamic printStartTime;
  dynamic printEndTime;
  dynamic transactionDiscountTotal;
  List<dynamic>? transactionDiscountDtoList;
  List<TransactionPaymentDtoList>? transactionPaymentDtoList;
  List<TransactionLineDtoList>? transactionLineDtoList;
  List<dynamic>? trxLinePaymentMappingDtoList;
  String? createdBy;
  DateTime? creationDate;
  String? guid;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  bool? isAccessible;
  bool? isChanged;
  bool? isChangedRecursive;

  Data({
    this.transactionId,
    this.approvedBy,
    this.transactionReopenedCount,
    this.transactionInitiatedTime,
    this.transactionClosedTime,
    this.transactionCancelledTime,
    this.transactionReopenedTime,
    this.sessionId,
    this.tentNumber,
    this.guestContactEmail,
    this.lockStatus,
    this.lockedByPosMachineId,
    this.lockedBySiteId,
    this.lockedByUserId,
    this.lockedTime,
    this.processedForLoyalty,
    this.transactionTypeId,
    this.isActive,
    this.transactionPaymentStatus,
    this.transactionPaymentStatusId,
    this.transactionPaymentStatusChangeDate,
    this.isNonChargeable,
    this.guestCount,
    this.guestContactNumber,
    this.guestName,
    this.transactionIdentifier,
    this.transactionTaxTotal,
    this.channel,
    this.transactionPaymentTotal,
    this.transactionDate,
    this.transactionAmount,
    this.transactionNetAmount,
    this.userId,
    this.primaryCardId,
    this.orderId,
    this.posTypeId,
    this.transactionNumber,
    this.transactionOtp,
    this.remarks,
    this.posMachineId,
    this.posMachine,
    this.status,
    this.transactionStatus,
    this.transactionStatusId,
    this.transactionStatusChangeDate,
    this.transactionProfileId,
    this.transactionProfileName,
    this.lastUpdateDate,
    this.lastUpdatedBy,
    this.tokenNumber,
    this.originalSystemReference,
    this.customerId,
    this.externalSystemReference,
    this.reprintCount,
    this.originalTransactionId,
    this.orderTypeGroupId,
    this.provisionalBillPrintCount,
    this.printCount,
    this.saveStartTime,
    this.saveEndTime,
    this.printStartTime,
    this.printEndTime,
    this.transactionDiscountTotal,
    this.transactionDiscountDtoList,
    this.transactionPaymentDtoList,
    this.transactionLineDtoList,
    this.trxLinePaymentMappingDtoList,
    this.createdBy,
    this.creationDate,
    this.guid,
    this.siteId,
    this.masterEntityId,
    this.synchStatus,
    this.isAccessible,
    this.isChanged,
    this.isChangedRecursive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionId: json["TransactionId"],
        approvedBy: json["ApprovedBy"],
        transactionReopenedCount: json["TransactionReopenedCount"],
        transactionInitiatedTime: json["TransactionInitiatedTime"] == null
            ? null
            : DateTime.parse(json["TransactionInitiatedTime"]),
        transactionClosedTime: json["TransactionClosedTime"],
        transactionCancelledTime: json["TransactionCancelledTime"],
        transactionReopenedTime: json["TransactionReopenedTime"],
        sessionId: json["SessionId"],
        tentNumber: json["TentNumber"],
        guestContactEmail: json["GuestContactEmail"],
        lockStatus: json["LockStatus"],
        lockedByPosMachineId: json["LockedByPOSMachineId"],
        lockedBySiteId: json["LockedBySiteId"],
        lockedByUserId: json["LockedByUserId"],
        lockedTime: json["LockedTime"],
        processedForLoyalty: json["ProcessedForLoyalty"],
        transactionTypeId: json["TransactionTypeId"],
        isActive: json["IsActive"],
        transactionPaymentStatus: json["TransactionPaymentStatus"],
        transactionPaymentStatusId: json["TransactionPaymentStatusId"],
        transactionPaymentStatusChangeDate:
            json["TransactionPaymentStatusChangeDate"] == null
                ? null
                : DateTime.parse(json["TransactionPaymentStatusChangeDate"]),
        isNonChargeable: json["IsNonChargeable"],
        guestCount: json["GuestCount"],
        guestContactNumber: json["GuestContactNumber"],
        guestName: json["GuestName"],
        transactionIdentifier: json["TransactionIdentifier"],
        transactionTaxTotal: json["TransactionTaxTotal"],
        channel: json["Channel"],
        transactionPaymentTotal: json["TransactionPaymentTotal"],
        transactionDate: json["TransactionDate"] == null
            ? null
            : DateTime.parse(json["TransactionDate"]),
        transactionAmount: json["TransactionAmount"],
        transactionNetAmount: json["TransactionNetAmount"],
        userId: json["UserId"],
        primaryCardId: json["PrimaryCardId"],
        orderId: json["OrderId"],
        posTypeId: json["POSTypeId"],
        transactionNumber: json["TransactionNumber"],
        transactionOtp: json["TransactionOTP"],
        remarks: json["Remarks"],
        posMachineId: json["POSMachineId"],
        posMachine: json["POSMachine"],
        status: json["Status"],
        transactionStatus: json["TransactionStatus"],
        transactionStatusId: json["TransactionStatusId"],
        transactionStatusChangeDate: json["TransactionStatusChangeDate"] == null
            ? null
            : DateTime.parse(json["TransactionStatusChangeDate"]),
        transactionProfileId: json["TransactionProfileId"],
        transactionProfileName: json["TransactionProfileName"],
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        tokenNumber: json["TokenNumber"],
        originalSystemReference: json["OriginalSystemReference"],
        customerId: json["CustomerId"],
        externalSystemReference: json["ExternalSystemReference"],
        reprintCount: json["ReprintCount"],
        originalTransactionId: json["OriginalTransactionId"],
        orderTypeGroupId: json["OrderTypeGroupId"],
        provisionalBillPrintCount: json["ProvisionalBillPrintCount"],
        printCount: json["PrintCount"],
        saveStartTime: json["SaveStartTime"],
        saveEndTime: json["SaveEndTime"],
        printStartTime: json["PrintStartTime"],
        printEndTime: json["PrintEndTime"],
        transactionDiscountTotal: json["TransactionDiscountTotal"],
        transactionDiscountDtoList: json["TransactionDiscountDTOList"] == null
            ? []
            : List<dynamic>.from(
                json["TransactionDiscountDTOList"]!.map((x) => x)),
        transactionPaymentDtoList: json["TransactionPaymentDTOList"] == null
            ? []
            : List<TransactionPaymentDtoList>.from(
                json["TransactionPaymentDTOList"]!
                    .map((x) => TransactionPaymentDtoList.fromJson(x))),
        transactionLineDtoList: json["TransactionLineDTOList"] == null
            ? []
            : List<TransactionLineDtoList>.from(json["TransactionLineDTOList"]!
                .map((x) => TransactionLineDtoList.fromJson(x))),
        trxLinePaymentMappingDtoList:
            json["TrxLinePaymentMappingDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["TrxLinePaymentMappingDTOList"]!.map((x) => x)),
        createdBy: json["CreatedBy"],
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        guid: json["Guid"],
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        synchStatus: json["SynchStatus"],
        isAccessible: json["IsAccessible"],
        isChanged: json["IsChanged"],
        isChangedRecursive: json["IsChangedRecursive"],
      );

  Map<String, dynamic> toJson() => {
        "TransactionId": transactionId,
        "ApprovedBy": approvedBy,
        "TransactionReopenedCount": transactionReopenedCount,
        "TransactionInitiatedTime": transactionInitiatedTime?.toIso8601String(),
        "TransactionClosedTime": transactionClosedTime,
        "TransactionCancelledTime": transactionCancelledTime,
        "TransactionReopenedTime": transactionReopenedTime,
        "SessionId": sessionId,
        "TentNumber": tentNumber,
        "GuestContactEmail": guestContactEmail,
        "LockStatus": lockStatus,
        "LockedByPOSMachineId": lockedByPosMachineId,
        "LockedBySiteId": lockedBySiteId,
        "LockedByUserId": lockedByUserId,
        "LockedTime": lockedTime,
        "ProcessedForLoyalty": processedForLoyalty,
        "TransactionTypeId": transactionTypeId,
        "IsActive": isActive,
        "TransactionPaymentStatus": transactionPaymentStatus,
        "TransactionPaymentStatusId": transactionPaymentStatusId,
        "TransactionPaymentStatusChangeDate":
            transactionPaymentStatusChangeDate?.toIso8601String(),
        "IsNonChargeable": isNonChargeable,
        "GuestCount": guestCount,
        "GuestContactNumber": guestContactNumber,
        "GuestName": guestName,
        "TransactionIdentifier": transactionIdentifier,
        "TransactionTaxTotal": transactionTaxTotal,
        "Channel": channel,
        "TransactionPaymentTotal": transactionPaymentTotal,
        "TransactionDate": transactionDate?.toIso8601String(),
        "TransactionAmount": transactionAmount,
        "TransactionNetAmount": transactionNetAmount,
        "UserId": userId,
        "PrimaryCardId": primaryCardId,
        "OrderId": orderId,
        "POSTypeId": posTypeId,
        "TransactionNumber": transactionNumber,
        "TransactionOTP": transactionOtp,
        "Remarks": remarks,
        "POSMachineId": posMachineId,
        "POSMachine": posMachine,
        "Status": status,
        "TransactionStatus": transactionStatus,
        "TransactionStatusId": transactionStatusId,
        "TransactionStatusChangeDate":
            transactionStatusChangeDate?.toIso8601String(),
        "TransactionProfileId": transactionProfileId,
        "TransactionProfileName": transactionProfileName,
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "TokenNumber": tokenNumber,
        "OriginalSystemReference": originalSystemReference,
        "CustomerId": customerId,
        "ExternalSystemReference": externalSystemReference,
        "ReprintCount": reprintCount,
        "OriginalTransactionId": originalTransactionId,
        "OrderTypeGroupId": orderTypeGroupId,
        "ProvisionalBillPrintCount": provisionalBillPrintCount,
        "PrintCount": printCount,
        "SaveStartTime": saveStartTime,
        "SaveEndTime": saveEndTime,
        "PrintStartTime": printStartTime,
        "PrintEndTime": printEndTime,
        "TransactionDiscountTotal": transactionDiscountTotal,
        "TransactionDiscountDTOList": transactionDiscountDtoList == null
            ? []
            : List<dynamic>.from(transactionDiscountDtoList!.map((x) => x)),
        "TransactionPaymentDTOList": transactionPaymentDtoList == null
            ? []
            : List<dynamic>.from(
                transactionPaymentDtoList!.map((x) => x.toJson())),
        "TransactionLineDTOList": transactionLineDtoList == null
            ? []
            : List<dynamic>.from(
                transactionLineDtoList!.map((x) => x.toJson())),
        "TrxLinePaymentMappingDTOList": trxLinePaymentMappingDtoList == null
            ? []
            : List<dynamic>.from(trxLinePaymentMappingDtoList!.map((x) => x)),
        "CreatedBy": createdBy,
        "CreationDate": creationDate?.toIso8601String(),
        "Guid": guid,
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "IsAccessible": isAccessible,
        "IsChanged": isChanged,
        "IsChangedRecursive": isChangedRecursive,
      };
}

class TransactionLineDtoList {
  DateTime? lineDate;
  String? lineStatus;
  int? lineStatusId;
  DateTime? lineStatusChangeDate;
  String? courseName;
  String? seatName;
  bool? processedForLoyalty;
  bool? isActive;
  dynamic lineReversedDate;
  dynamic lineFulfilledDate;
  dynamic lineBookedDate;
  dynamic lineOrderedDate;
  String? externalSourceReference;
  dynamic systemReference;
  int? comboProductId;
  int? modifierSetId;
  int? modifierSetDetailId;
  bool? isParentModifier;
  bool? isFreeModifier;
  bool? isNonChargeable;
  int? orderTypeId;
  bool? isReversed;
  int? viewGroupingNumber;
  int? productSegmentId;
  bool? onPrintHold;
  bool? is9999Product;
  bool? isCrossSellProduct;
  bool? isUpsellProduct;
  dynamic seatNumber;
  String? tagNumber;
  int? transactionProfileId;
  int? accountId;
  String? priceType;
  dynamic userOverriddenPrice;
  dynamic membershipPrice;
  dynamic comboAllocatedProductPrice;
  dynamic promotionPrice;
  dynamic transactionProfilePrice;
  dynamic userRolePrice;
  dynamic basePrice;
  int? lineNumber;
  int? transactionLineId;
  int? categoryId;
  int? transactionId;
  String? approvedBy;
  String? additionalLineInformation;
  String? discountIdentifier;
  String? discountIndicator;
  String? categoryName;
  int? productId;
  dynamic quantity;
  dynamic amount;
  dynamic netAmount;
  double? discountedAmountPreTax;
  double? accountCredits;
  double? accountCourtesy;
  double? taxPercentage;
  int? taxId;
  String? taxName;
  int? parentTransactionLineId;
  double? accountTime;
  double? accountBonus;
  double? accountTickets;
  double? accountLoyaltyPoints;
  String? remarks;
  int? promotionId;
  bool? receiptPrinted;
  int? kotPrintCount;
  int? gamePlayId;
  bool? kdsSent;
  dynamic cancelledTime;
  String? cancelledBy;
  bool? isWaiverSignRequired;
  int? originalLineId;
  String? guid;
  bool? synchStatus;
  int? siteId;
  int? masterEntityId;
  int? membershipId;
  int? membershipRewardsId;
  bool? isChanged;
  bool? isAmountChanged;
  bool? isNetAmountChanged;
  bool? isChangedRecursive;
  String? productName;
  String? createdBy;
  DateTime? creationDate;
  String? lastUpdatedBy;
  DateTime? lastUpdateDate;
  List<dynamic>? transactionLineDtoList;
  List<TransactionAccountDtoList>? transactionAccountDtoList;
  List<dynamic>? transactionTaxLineDtoList;
  List<dynamic>? transactionLineKdsOrderEntryMappingDtoList;
  String? cancelCode;

  TransactionLineDtoList({
    this.lineDate,
    this.lineStatus,
    this.lineStatusId,
    this.lineStatusChangeDate,
    this.courseName,
    this.seatName,
    this.processedForLoyalty,
    this.isActive,
    this.lineReversedDate,
    this.lineFulfilledDate,
    this.lineBookedDate,
    this.lineOrderedDate,
    this.externalSourceReference,
    this.systemReference,
    this.comboProductId,
    this.modifierSetId,
    this.modifierSetDetailId,
    this.isParentModifier,
    this.isFreeModifier,
    this.isNonChargeable,
    this.orderTypeId,
    this.isReversed,
    this.viewGroupingNumber,
    this.productSegmentId,
    this.onPrintHold,
    this.is9999Product,
    this.isCrossSellProduct,
    this.isUpsellProduct,
    this.seatNumber,
    this.tagNumber,
    this.transactionProfileId,
    this.accountId,
    this.priceType,
    this.userOverriddenPrice,
    this.membershipPrice,
    this.comboAllocatedProductPrice,
    this.promotionPrice,
    this.transactionProfilePrice,
    this.userRolePrice,
    this.basePrice,
    this.lineNumber,
    this.transactionLineId,
    this.categoryId,
    this.transactionId,
    this.approvedBy,
    this.additionalLineInformation,
    this.discountIdentifier,
    this.discountIndicator,
    this.categoryName,
    this.productId,
    this.quantity,
    this.amount,
    this.netAmount,
    this.discountedAmountPreTax,
    this.accountCredits,
    this.accountCourtesy,
    this.taxPercentage,
    this.taxId,
    this.taxName,
    this.parentTransactionLineId,
    this.accountTime,
    this.accountBonus,
    this.accountTickets,
    this.accountLoyaltyPoints,
    this.remarks,
    this.promotionId,
    this.receiptPrinted,
    this.kotPrintCount,
    this.gamePlayId,
    this.kdsSent,
    this.cancelledTime,
    this.cancelledBy,
    this.isWaiverSignRequired,
    this.originalLineId,
    this.guid,
    this.synchStatus,
    this.siteId,
    this.masterEntityId,
    this.membershipId,
    this.membershipRewardsId,
    this.isChanged,
    this.isAmountChanged,
    this.isNetAmountChanged,
    this.isChangedRecursive,
    this.productName,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.transactionLineDtoList,
    this.transactionAccountDtoList,
    this.transactionTaxLineDtoList,
    this.transactionLineKdsOrderEntryMappingDtoList,
    this.cancelCode,
  });

  factory TransactionLineDtoList.fromJson(Map<String, dynamic> json) =>
      TransactionLineDtoList(
        lineDate:
            json["LineDate"] == null ? null : DateTime.parse(json["LineDate"]),
        lineStatus: json["LineStatus"],
        lineStatusId: json["LineStatusId"],
        lineStatusChangeDate: json["LineStatusChangeDate"] == null
            ? null
            : DateTime.parse(json["LineStatusChangeDate"]),
        courseName: json["CourseName"],
        seatName: json["SeatName"],
        processedForLoyalty: json["ProcessedForLoyalty"],
        isActive: json["IsActive"],
        lineReversedDate: json["LineReversedDate"],
        lineFulfilledDate: json["LineFulfilledDate"],
        lineBookedDate: json["LineBookedDate"],
        lineOrderedDate: json["LineOrderedDate"],
        externalSourceReference: json["ExternalSourceReference"],
        systemReference: json["SystemReference"],
        comboProductId: json["ComboProductId"],
        modifierSetId: json["ModifierSetId"],
        modifierSetDetailId: json["ModifierSetDetailId"],
        isParentModifier: json["IsParentModifier"],
        isFreeModifier: json["IsFreeModifier"],
        isNonChargeable: json["IsNonChargeable"],
        orderTypeId: json["OrderTypeId"],
        isReversed: json["IsReversed"],
        viewGroupingNumber: json["ViewGroupingNumber"],
        productSegmentId: json["ProductSegmentId"],
        onPrintHold: json["OnPrintHold"],
        is9999Product: json["Is9999Product"],
        isCrossSellProduct: json["IsCrossSellProduct"],
        isUpsellProduct: json["IsUpsellProduct"],
        seatNumber: json["SeatNumber"],
        tagNumber: json["TagNumber"],
        transactionProfileId: json["TransactionProfileId"],
        accountId: json["AccountId"],
        priceType: json["PriceType"],
        userOverriddenPrice: json["UserOverriddenPrice"],
        membershipPrice: json["MembershipPrice"],
        comboAllocatedProductPrice: json["ComboAllocatedProductPrice"],
        promotionPrice: json["PromotionPrice"],
        transactionProfilePrice: json["TransactionProfilePrice"],
        userRolePrice: json["UserRolePrice"],
        basePrice: json["BasePrice"],
        lineNumber: json["LineNumber"],
        transactionLineId: json["TransactionLineId"],
        categoryId: json["CategoryId"],
        transactionId: json["TransactionId"],
        approvedBy: json["ApprovedBy"],
        additionalLineInformation: json["AdditionalLineInformation"],
        discountIdentifier: json["DiscountIdentifier"],
        discountIndicator: json["DiscountIndicator"],
        categoryName: json["CategoryName"],
        productId: json["ProductId"],
        quantity: json["Quantity"],
        amount: json["Amount"],
        netAmount: json["NetAmount"],
        discountedAmountPreTax: json["DiscountedAmountPreTax"],
        accountCredits: json["AccountCredits"],
        accountCourtesy: json["AccountCourtesy"],
        taxPercentage: json["TaxPercentage"],
        taxId: json["TaxId"],
        taxName: json["TaxName"],
        parentTransactionLineId: json["ParentTransactionLineId"],
        accountTime: json["AccountTime"],
        accountBonus: json["AccountBonus"],
        accountTickets: json["AccountTickets"],
        accountLoyaltyPoints: json["AccountLoyaltyPoints"],
        remarks: json["Remarks"],
        promotionId: json["PromotionId"],
        receiptPrinted: json["ReceiptPrinted"],
        kotPrintCount: json["KOTPrintCount"],
        gamePlayId: json["GamePlayId"],
        kdsSent: json["KDSSent"],
        cancelledTime: json["CancelledTime"],
        cancelledBy: json["CancelledBy"],
        isWaiverSignRequired: json["IsWaiverSignRequired"],
        originalLineId: json["OriginalLineId"],
        guid: json["Guid"],
        synchStatus: json["SynchStatus"],
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        membershipId: json["MembershipId"],
        membershipRewardsId: json["MembershipRewardsId"],
        isChanged: json["IsChanged"],
        isAmountChanged: json["IsAmountChanged"],
        isNetAmountChanged: json["IsNetAmountChanged"],
        isChangedRecursive: json["IsChangedRecursive"],
        productName: json["ProductName"],
        createdBy: json["CreatedBy"],
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        transactionLineDtoList: json["TransactionLineDTOList"] == null
            ? []
            : List<dynamic>.from(json["TransactionLineDTOList"]!.map((x) => x)),
        transactionAccountDtoList: json["TransactionAccountDTOList"] == null
            ? []
            : List<TransactionAccountDtoList>.from(
                json["TransactionAccountDTOList"]!
                    .map((x) => TransactionAccountDtoList.fromJson(x))),
        transactionTaxLineDtoList: json["TransactionTaxLineDTOList"] == null
            ? []
            : List<dynamic>.from(
                json["TransactionTaxLineDTOList"]!.map((x) => x)),
        transactionLineKdsOrderEntryMappingDtoList:
            json["TransactionLineKDSOrderEntryMappingDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["TransactionLineKDSOrderEntryMappingDTOList"]!
                        .map((x) => x)),
        cancelCode: json["CancelCode"],
      );

  Map<String, dynamic> toJson() => {
        "LineDate": lineDate?.toIso8601String(),
        "LineStatus": lineStatus,
        "LineStatusId": lineStatusId,
        "LineStatusChangeDate": lineStatusChangeDate?.toIso8601String(),
        "CourseName": courseName,
        "SeatName": seatName,
        "ProcessedForLoyalty": processedForLoyalty,
        "IsActive": isActive,
        "LineReversedDate": lineReversedDate,
        "LineFulfilledDate": lineFulfilledDate,
        "LineBookedDate": lineBookedDate,
        "LineOrderedDate": lineOrderedDate,
        "ExternalSourceReference": externalSourceReference,
        "SystemReference": systemReference,
        "ComboProductId": comboProductId,
        "ModifierSetId": modifierSetId,
        "ModifierSetDetailId": modifierSetDetailId,
        "IsParentModifier": isParentModifier,
        "IsFreeModifier": isFreeModifier,
        "IsNonChargeable": isNonChargeable,
        "OrderTypeId": orderTypeId,
        "IsReversed": isReversed,
        "ViewGroupingNumber": viewGroupingNumber,
        "ProductSegmentId": productSegmentId,
        "OnPrintHold": onPrintHold,
        "Is9999Product": is9999Product,
        "IsCrossSellProduct": isCrossSellProduct,
        "IsUpsellProduct": isUpsellProduct,
        "SeatNumber": seatNumber,
        "TagNumber": tagNumber,
        "TransactionProfileId": transactionProfileId,
        "AccountId": accountId,
        "PriceType": priceType,
        "UserOverriddenPrice": userOverriddenPrice,
        "MembershipPrice": membershipPrice,
        "ComboAllocatedProductPrice": comboAllocatedProductPrice,
        "PromotionPrice": promotionPrice,
        "TransactionProfilePrice": transactionProfilePrice,
        "UserRolePrice": userRolePrice,
        "BasePrice": basePrice,
        "LineNumber": lineNumber,
        "TransactionLineId": transactionLineId,
        "CategoryId": categoryId,
        "TransactionId": transactionId,
        "ApprovedBy": approvedBy,
        "AdditionalLineInformation": additionalLineInformation,
        "DiscountIdentifier": discountIdentifier,
        "DiscountIndicator": discountIndicator,
        "CategoryName": categoryName,
        "ProductId": productId,
        "Quantity": quantity,
        "Amount": amount,
        "NetAmount": netAmount,
        "DiscountedAmountPreTax": discountedAmountPreTax,
        "AccountCredits": accountCredits,
        "AccountCourtesy": accountCourtesy,
        "TaxPercentage": taxPercentage,
        "TaxId": taxId,
        "TaxName": taxName,
        "ParentTransactionLineId": parentTransactionLineId,
        "AccountTime": accountTime,
        "AccountBonus": accountBonus,
        "AccountTickets": accountTickets,
        "AccountLoyaltyPoints": accountLoyaltyPoints,
        "Remarks": remarks,
        "PromotionId": promotionId,
        "ReceiptPrinted": receiptPrinted,
        "KOTPrintCount": kotPrintCount,
        "GamePlayId": gamePlayId,
        "KDSSent": kdsSent,
        "CancelledTime": cancelledTime,
        "CancelledBy": cancelledBy,
        "IsWaiverSignRequired": isWaiverSignRequired,
        "OriginalLineId": originalLineId,
        "Guid": guid,
        "SynchStatus": synchStatus,
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "MembershipId": membershipId,
        "MembershipRewardsId": membershipRewardsId,
        "IsChanged": isChanged,
        "IsAmountChanged": isAmountChanged,
        "IsNetAmountChanged": isNetAmountChanged,
        "IsChangedRecursive": isChangedRecursive,
        "ProductName": productName,
        "CreatedBy": createdBy,
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "TransactionLineDTOList": transactionLineDtoList == null
            ? []
            : List<dynamic>.from(transactionLineDtoList!.map((x) => x)),
        "TransactionAccountDTOList": transactionAccountDtoList == null
            ? []
            : List<dynamic>.from(
                transactionAccountDtoList!.map((x) => x.toJson())),
        "TransactionTaxLineDTOList": transactionTaxLineDtoList == null
            ? []
            : List<dynamic>.from(transactionTaxLineDtoList!.map((x) => x)),
        "TransactionLineKDSOrderEntryMappingDTOList":
            transactionLineKdsOrderEntryMappingDtoList == null
                ? []
                : List<dynamic>.from(
                    transactionLineKdsOrderEntryMappingDtoList!.map((x) => x)),
        "CancelCode": cancelCode,
      };
}

class TransactionAccountDtoList {
  int? transactionAccountId;
  int? transactionId;
  int? transactionLineId;
  int? accountId;
  String? tagNumber;
  String? serialNumber;
  bool? existingAccount;
  bool? customerLinked;
  bool? invalidateAccount;
  bool? isActive;
  String? createdBy;
  DateTime? creationDate;
  String? lastUpdatedBy;
  DateTime? lastUpdatedDate;
  String? guid;
  int? siteId;
  bool? synchStatus;
  int? masterEntityId;
  List<dynamic>? transactionLineAccountDiscountMappingDtoList;
  List<dynamic>? transactionLineAccountGameMappingDtoList;
  List<dynamic>? transactionLineAccountCreditPlusMappingDtoList;
  bool? isChanged;
  bool? isChangedRecursive;

  TransactionAccountDtoList({
    this.transactionAccountId,
    this.transactionId,
    this.transactionLineId,
    this.accountId,
    this.tagNumber,
    this.serialNumber,
    this.existingAccount,
    this.customerLinked,
    this.invalidateAccount,
    this.isActive,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdatedDate,
    this.guid,
    this.siteId,
    this.synchStatus,
    this.masterEntityId,
    this.transactionLineAccountDiscountMappingDtoList,
    this.transactionLineAccountGameMappingDtoList,
    this.transactionLineAccountCreditPlusMappingDtoList,
    this.isChanged,
    this.isChangedRecursive,
  });

  factory TransactionAccountDtoList.fromJson(Map<String, dynamic> json) =>
      TransactionAccountDtoList(
        transactionAccountId: json["TransactionAccountId"],
        transactionId: json["TransactionId"],
        transactionLineId: json["TransactionLineId"],
        accountId: json["AccountId"],
        tagNumber: json["TagNumber"],
        serialNumber: json["SerialNumber"],
        existingAccount: json["ExistingAccount"],
        customerLinked: json["CustomerLinked"],
        invalidateAccount: json["InvalidateAccount"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        lastUpdatedDate: json["LastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["LastUpdatedDate"]),
        guid: json["Guid"],
        siteId: json["SiteId"],
        synchStatus: json["SynchStatus"],
        masterEntityId: json["MasterEntityId"],
        transactionLineAccountDiscountMappingDtoList:
            json["TransactionLineAccountDiscountMappingDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["TransactionLineAccountDiscountMappingDTOList"]!
                        .map((x) => x)),
        transactionLineAccountGameMappingDtoList:
            json["TransactionLineAccountGameMappingDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["TransactionLineAccountGameMappingDTOList"]!
                        .map((x) => x)),
        transactionLineAccountCreditPlusMappingDtoList:
            json["TransactionLineAccountCreditPlusMappingDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["TransactionLineAccountCreditPlusMappingDTOList"]!
                        .map((x) => x)),
        isChanged: json["IsChanged"],
        isChangedRecursive: json["IsChangedRecursive"],
      );

  Map<String, dynamic> toJson() => {
        "TransactionAccountId": transactionAccountId,
        "TransactionId": transactionId,
        "TransactionLineId": transactionLineId,
        "AccountId": accountId,
        "TagNumber": tagNumber,
        "SerialNumber": serialNumber,
        "ExistingAccount": existingAccount,
        "CustomerLinked": customerLinked,
        "InvalidateAccount": invalidateAccount,
        "IsActive": isActive,
        "CreatedBy": createdBy,
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "Guid": guid,
        "SiteId": siteId,
        "SynchStatus": synchStatus,
        "MasterEntityId": masterEntityId,
        "TransactionLineAccountDiscountMappingDTOList":
            transactionLineAccountDiscountMappingDtoList == null
                ? []
                : List<dynamic>.from(
                    transactionLineAccountDiscountMappingDtoList!
                        .map((x) => x)),
        "TransactionLineAccountGameMappingDTOList":
            transactionLineAccountGameMappingDtoList == null
                ? []
                : List<dynamic>.from(
                    transactionLineAccountGameMappingDtoList!.map((x) => x)),
        "TransactionLineAccountCreditPlusMappingDTOList":
            transactionLineAccountCreditPlusMappingDtoList == null
                ? []
                : List<dynamic>.from(
                    transactionLineAccountCreditPlusMappingDtoList!
                        .map((x) => x)),
        "IsChanged": isChanged,
        "IsChangedRecursive": isChangedRecursive,
      };
}

class TransactionPaymentDtoList {
  int? paymentId;
  int? approverId;
  int? transactionId;
  int? paymentModeId;
  dynamic amount;
  String? creditCardNumber;
  String? nameOnCreditCard;
  String? creditCardName;
  String? creditCardExpiry;
  String? creditCardAuthorization;
  int? cardId;
  int? ccResponseId;
  String? cardEntitlementType;
  int? cardCreditPlusId;
  int? couponSetId;
  String? couponNumber;
  int? cpConsumptionId;
  dynamic reference;
  String? guid;
  bool? synchStatus;
  int? siteId;
  String? memo;
  DateTime? paymentDate;
  int? cashDrawerId;
  DateTime? lastUpdateDate;
  DateTime? creationDate;
  String? createdBy;
  String? lastUpdatedUser;
  int? parentPaymentId;
  dynamic tenderedAmount;
  dynamic tipAmount;
  String? posMachine;
  int? masterEntityId;
  dynamic currencyCode;
  dynamic currencyRate;
  dynamic isTaxable;
  dynamic couponValue;
  dynamic approvedBy;
  int? subscriptionAuthorizationMode;
  String? customerCardProfileId;
  String? externalSourceReference;
  String? attribute1;
  String? attribute2;
  String? attribute3;
  String? attribute4;
  String? attribute5;
  int? paymentStatusId;
  String? paymentStatus;
  DateTime? paymentStatusChangeDate;
  dynamic isKeyedMode;
  String? paymentModeOtp;
  dynamic refundedAmount;
  dynamic refundedTipAmount;
  dynamic systemReference;
  List<dynamic>? paymentTransactionDtoList;
  List<dynamic>? transactionPaymentDtoList;
  List<dynamic>? trxLinePaymentMappingDtoList;
  bool? isChanged;
  bool? isChangedRecursive;

  TransactionPaymentDtoList({
    this.paymentId,
    this.approverId,
    this.transactionId,
    this.paymentModeId,
    this.amount,
    this.creditCardNumber,
    this.nameOnCreditCard,
    this.creditCardName,
    this.creditCardExpiry,
    this.creditCardAuthorization,
    this.cardId,
    this.ccResponseId,
    this.cardEntitlementType,
    this.cardCreditPlusId,
    this.couponSetId,
    this.couponNumber,
    this.cpConsumptionId,
    this.reference,
    this.guid,
    this.synchStatus,
    this.siteId,
    this.memo,
    this.paymentDate,
    this.cashDrawerId,
    this.lastUpdateDate,
    this.creationDate,
    this.createdBy,
    this.lastUpdatedUser,
    this.parentPaymentId,
    this.tenderedAmount,
    this.tipAmount,
    this.posMachine,
    this.masterEntityId,
    this.currencyCode,
    this.currencyRate,
    this.isTaxable,
    this.couponValue,
    this.approvedBy,
    this.subscriptionAuthorizationMode,
    this.customerCardProfileId,
    this.externalSourceReference,
    this.attribute1,
    this.attribute2,
    this.attribute3,
    this.attribute4,
    this.attribute5,
    this.paymentStatusId,
    this.paymentStatus,
    this.paymentStatusChangeDate,
    this.isKeyedMode,
    this.paymentModeOtp,
    this.refundedAmount,
    this.refundedTipAmount,
    this.systemReference,
    this.paymentTransactionDtoList,
    this.transactionPaymentDtoList,
    this.trxLinePaymentMappingDtoList,
    this.isChanged,
    this.isChangedRecursive,
  });

  factory TransactionPaymentDtoList.fromJson(Map<String, dynamic> json) =>
      TransactionPaymentDtoList(
        paymentId: json["PaymentId"],
        approverId: json["ApproverId"],
        transactionId: json["TransactionId"],
        paymentModeId: json["PaymentModeId"],
        amount: json["Amount"],
        creditCardNumber: json["CreditCardNumber"],
        nameOnCreditCard: json["NameOnCreditCard"],
        creditCardName: json["CreditCardName"],
        creditCardExpiry: json["CreditCardExpiry"],
        creditCardAuthorization: json["CreditCardAuthorization"],
        cardId: json["CardId"],
        ccResponseId: json["CCResponseId"],
        cardEntitlementType: json["CardEntitlementType"],
        cardCreditPlusId: json["CardCreditPlusId"],
        couponSetId: json["CouponSetId"],
        couponNumber: json["CouponNumber"],
        cpConsumptionId: json["CPConsumptionId"],
        reference: json["Reference"],
        guid: json["Guid"],
        synchStatus: json["SynchStatus"],
        siteId: json["SiteId"],
        memo: json["Memo"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        cashDrawerId: json["CashDrawerId"],
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedUser: json["LastUpdatedUser"],
        parentPaymentId: json["ParentPaymentId"],
        tenderedAmount: json["TenderedAmount"],
        tipAmount: json["TipAmount"],
        posMachine: json["PosMachine"],
        masterEntityId: json["MasterEntityId"],
        currencyCode: json["CurrencyCode"],
        currencyRate: json["CurrencyRate"],
        isTaxable: json["IsTaxable"],
        couponValue: json["CouponValue"],
        approvedBy: json["ApprovedBy"],
        subscriptionAuthorizationMode: json["SubscriptionAuthorizationMode"],
        customerCardProfileId: json["CustomerCardProfileId"],
        externalSourceReference: json["ExternalSourceReference"],
        attribute1: json["Attribute1"],
        attribute2: json["Attribute2"],
        attribute3: json["Attribute3"],
        attribute4: json["Attribute4"],
        attribute5: json["Attribute5"],
        paymentStatusId: json["PaymentStatusId"],
        paymentStatus: json["PaymentStatus"],
        paymentStatusChangeDate: json["PaymentStatusChangeDate"] == null
            ? null
            : DateTime.parse(json["PaymentStatusChangeDate"]),
        isKeyedMode: json["IsKeyedMode"],
        paymentModeOtp: json["PaymentModeOTP"],
        refundedAmount: json["RefundedAmount"],
        refundedTipAmount: json["RefundedTipAmount"],
        systemReference: json["SystemReference"],
        paymentTransactionDtoList: json["PaymentTransactionDTOList"] == null
            ? []
            : List<dynamic>.from(
                json["PaymentTransactionDTOList"]!.map((x) => x)),
        transactionPaymentDtoList: json["TransactionPaymentDTOList"] == null
            ? []
            : List<dynamic>.from(
                json["TransactionPaymentDTOList"]!.map((x) => x)),
        trxLinePaymentMappingDtoList:
            json["TrxLinePaymentMappingDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["TrxLinePaymentMappingDTOList"]!.map((x) => x)),
        isChanged: json["IsChanged"],
        isChangedRecursive: json["IsChangedRecursive"],
      );

  Map<String, dynamic> toJson() => {
        "PaymentId": paymentId,
        "ApproverId": approverId,
        "TransactionId": transactionId,
        "PaymentModeId": paymentModeId,
        "Amount": amount,
        "CreditCardNumber": creditCardNumber,
        "NameOnCreditCard": nameOnCreditCard,
        "CreditCardName": creditCardName,
        "CreditCardExpiry": creditCardExpiry,
        "CreditCardAuthorization": creditCardAuthorization,
        "CardId": cardId,
        "CCResponseId": ccResponseId,
        "CardEntitlementType": cardEntitlementType,
        "CardCreditPlusId": cardCreditPlusId,
        "CouponSetId": couponSetId,
        "CouponNumber": couponNumber,
        "CPConsumptionId": cpConsumptionId,
        "Reference": reference,
        "Guid": guid,
        "SynchStatus": synchStatus,
        "SiteId": siteId,
        "Memo": memo,
        "PaymentDate": paymentDate?.toIso8601String(),
        "CashDrawerId": cashDrawerId,
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "CreationDate": creationDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedUser": lastUpdatedUser,
        "ParentPaymentId": parentPaymentId,
        "TenderedAmount": tenderedAmount,
        "TipAmount": tipAmount,
        "PosMachine": posMachine,
        "MasterEntityId": masterEntityId,
        "CurrencyCode": currencyCode,
        "CurrencyRate": currencyRate,
        "IsTaxable": isTaxable,
        "CouponValue": couponValue,
        "ApprovedBy": approvedBy,
        "SubscriptionAuthorizationMode": subscriptionAuthorizationMode,
        "CustomerCardProfileId": customerCardProfileId,
        "ExternalSourceReference": externalSourceReference,
        "Attribute1": attribute1,
        "Attribute2": attribute2,
        "Attribute3": attribute3,
        "Attribute4": attribute4,
        "Attribute5": attribute5,
        "PaymentStatusId": paymentStatusId,
        "PaymentStatus": paymentStatus,
        "PaymentStatusChangeDate": paymentStatusChangeDate?.toIso8601String(),
        "IsKeyedMode": isKeyedMode,
        "PaymentModeOTP": paymentModeOtp,
        "RefundedAmount": refundedAmount,
        "RefundedTipAmount": refundedTipAmount,
        "SystemReference": systemReference,
        "PaymentTransactionDTOList": paymentTransactionDtoList == null
            ? []
            : List<dynamic>.from(paymentTransactionDtoList!.map((x) => x)),
        "TransactionPaymentDTOList": transactionPaymentDtoList == null
            ? []
            : List<dynamic>.from(transactionPaymentDtoList!.map((x) => x)),
        "TrxLinePaymentMappingDTOList": trxLinePaymentMappingDtoList == null
            ? []
            : List<dynamic>.from(trxLinePaymentMappingDtoList!.map((x) => x)),
        "IsChanged": isChanged,
        "IsChangedRecursive": isChangedRecursive,
      };
}
