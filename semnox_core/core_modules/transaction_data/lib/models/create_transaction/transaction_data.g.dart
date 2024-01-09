// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionData _$$_TransactionDataFromJson(Map<String, dynamic> json) =>
    _$_TransactionData(
      transactionId: json['TransactionId'] as int,
      approvedBy: json['ApprovedBy'] as int,
      transactionReopenedCount: json['TransactionReopenedCount'] as int,
      transactionInitiatedTime: json['TransactionInitiatedTime'],
      transactionClosedTime: json['TransactionClosedTime'],
      transactionCancelledTime: json['TransactionCancelledTime'],
      transactionReopenedTime: json['TransactionReopenedTime'],
      sessionId: json['SessionId'] as int,
      tentNumber: json['TentNumber'] as String?,
      guestContactEmail: json['GuestContactEmail'] as String?,
      lockStatus: json['LockStatus'] as String,
      lockedByPosMachineId: json['LockedByPOSMachineId'] as int,
      lockedBySiteId: json['LockedBySiteId'] as int,
      lockedByUserId: json['LockedByUserId'] as int,
      lockedTime: json['LockedTime'],
      processedForLoyalty: json['ProcessedForLoyalty'] as bool,
      transactionTypeId: json['TransactionTypeId'] as int,
      isActive: json['IsActive'] as bool,
      transactionPaymentStatus: json['TransactionPaymentStatus'] as String?,
      transactionPaymentStatusId: json['TransactionPaymentStatusId'] as int,
      transactionPaymentStatusChangeDate:
          json['TransactionPaymentStatusChangeDate'],
      isNonChargeable: json['IsNonChargeable'] as bool,
      guestCount: json['GuestCount'] as int,
      guestContactNumber: json['GuestContactNumber'] as String?,
      guestName: json['GuestName'] as String?,
      transactionIdentifier: json['TransactionIdentifier'] as String?,
      transactionTaxTotal: (json['TransactionTaxTotal'] as num).toDouble(),
      channel: json['Channel'] as String?,
      transactionPaymentTotal:
          (json['TransactionPaymentTotal'] as num).toDouble(),
      transactionDate: json['TransactionDate'] as String?,
      transactionAmount: (json['TransactionAmount'] as num).toDouble(),
      transactionNetAmount: (json['TransactionNetAmount'] as num).toDouble(),
      userId: json['UserId'] as int,
      primaryCardId: json['PrimaryCardId'] as int,
      orderId: json['OrderId'] as int,
      posTypeId: json['POSTypeId'] as int,
      transactionNumber: json['TransactionNumber'] as String?,
      transactionOTP: json['TransactionOTP'] as String?,
      remarks: json['Remarks'] as String,
      posMachineId: json['POSMachineId'] as int,
      status: json['Status'] as String,
      transactionStatus: json['TransactionStatus'] as String,
      transactionStatusId: json['TransactionStatusId'] as int,
      transactionStatusChangeDate: json['TransactionStatusChangeDate'],
      transactionProfileId: json['TransactionProfileId'] as int,
      lastUpdateDate: json['LastUpdateDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      tokenNumber: json['TokenNumber'],
      originalSystemReference: json['OriginalSystemReference'] as String?,
      customerId: json['CustomerId'] as int,
      externalSystemReference: json['ExternalSystemReference'] as String?,
      reprintCount: json['ReprintCount'] as int,
      originalTransactionId: json['OriginalTransactionId'] as int,
      orderTypeGroupId: json['OrderTypeGroupId'] as int,
      printCount: json['PrintCount'] as int,
      saveStartTime: json['SaveStartTime'],
      saveEndTime: json['SaveEndTime'],
      printStartTime: json['PrintStartTime'],
      printEndTime: json['PrintEndTime'],
      transactionDiscountTotal:
          (json['TransactionDiscountTotal'] as num).toDouble(),
      transactionDiscountDTOList: (json['TransactionDiscountDTOList']
              as List<dynamic>)
          .map(
              (e) => TransactionDiscountDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactionPaymentDTOList: (json['TransactionPaymentDTOList']
              as List<dynamic>)
          .map((e) => TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactionLineDTOList: (json['TransactionLineDTOList'] as List<dynamic>)
          .map((e) => TransactionLineDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      trxLinePaymentMappingDTOList:
          json['TrxLinePaymentMappingDTOList'] as List<dynamic>,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      guid: json['Guid'] as String?,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      isAccessible: json['IsAccessible'] as bool,
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      transactionLinesGroups: (json['transactionLinesGroups']
                  as Map<String, dynamic>?)
              ?.map(
            (k, e) => MapEntry(
                int.parse(k),
                (e as List<dynamic>)
                    .map((e) =>
                        TransactionLineDTO.fromJson(e as Map<String, dynamic>))
                    .toList()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_TransactionDataToJson(_$_TransactionData instance) =>
    <String, dynamic>{
      'TransactionId': instance.transactionId,
      'ApprovedBy': instance.approvedBy,
      'TransactionReopenedCount': instance.transactionReopenedCount,
      'TransactionInitiatedTime': instance.transactionInitiatedTime,
      'TransactionClosedTime': instance.transactionClosedTime,
      'TransactionCancelledTime': instance.transactionCancelledTime,
      'TransactionReopenedTime': instance.transactionReopenedTime,
      'SessionId': instance.sessionId,
      'TentNumber': instance.tentNumber,
      'GuestContactEmail': instance.guestContactEmail,
      'LockStatus': instance.lockStatus,
      'LockedByPOSMachineId': instance.lockedByPosMachineId,
      'LockedBySiteId': instance.lockedBySiteId,
      'LockedByUserId': instance.lockedByUserId,
      'LockedTime': instance.lockedTime,
      'ProcessedForLoyalty': instance.processedForLoyalty,
      'TransactionTypeId': instance.transactionTypeId,
      'IsActive': instance.isActive,
      'TransactionPaymentStatus': instance.transactionPaymentStatus,
      'TransactionPaymentStatusId': instance.transactionPaymentStatusId,
      'TransactionPaymentStatusChangeDate':
          instance.transactionPaymentStatusChangeDate,
      'IsNonChargeable': instance.isNonChargeable,
      'GuestCount': instance.guestCount,
      'GuestContactNumber': instance.guestContactNumber,
      'GuestName': instance.guestName,
      'TransactionIdentifier': instance.transactionIdentifier,
      'TransactionTaxTotal': instance.transactionTaxTotal,
      'Channel': instance.channel,
      'TransactionPaymentTotal': instance.transactionPaymentTotal,
      'TransactionDate': instance.transactionDate,
      'TransactionAmount': instance.transactionAmount,
      'TransactionNetAmount': instance.transactionNetAmount,
      'UserId': instance.userId,
      'PrimaryCardId': instance.primaryCardId,
      'OrderId': instance.orderId,
      'POSTypeId': instance.posTypeId,
      'TransactionNumber': instance.transactionNumber,
      'TransactionOTP': instance.transactionOTP,
      'Remarks': instance.remarks,
      'POSMachineId': instance.posMachineId,
      'Status': instance.status,
      'TransactionStatus': instance.transactionStatus,
      'TransactionStatusId': instance.transactionStatusId,
      'TransactionStatusChangeDate': instance.transactionStatusChangeDate,
      'TransactionProfileId': instance.transactionProfileId,
      'LastUpdateDate': instance.lastUpdateDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'TokenNumber': instance.tokenNumber,
      'OriginalSystemReference': instance.originalSystemReference,
      'CustomerId': instance.customerId,
      'ExternalSystemReference': instance.externalSystemReference,
      'ReprintCount': instance.reprintCount,
      'OriginalTransactionId': instance.originalTransactionId,
      'OrderTypeGroupId': instance.orderTypeGroupId,
      'PrintCount': instance.printCount,
      'SaveStartTime': instance.saveStartTime,
      'SaveEndTime': instance.saveEndTime,
      'PrintStartTime': instance.printStartTime,
      'PrintEndTime': instance.printEndTime,
      'TransactionDiscountTotal': instance.transactionDiscountTotal,
      'TransactionDiscountDTOList': instance.transactionDiscountDTOList,
      'TransactionPaymentDTOList': instance.transactionPaymentDTOList,
      'TransactionLineDTOList': instance.transactionLineDTOList,
      'TrxLinePaymentMappingDTOList': instance.trxLinePaymentMappingDTOList,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'IsAccessible': instance.isAccessible,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
      'transactionLinesGroups': instance.transactionLinesGroups
          .map((k, e) => MapEntry(k.toString(), e)),
    };
