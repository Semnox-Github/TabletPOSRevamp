// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_machine_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PosMachineDate _$$_PosMachineDateFromJson(Map<String, dynamic> json) =>
    _$_PosMachineDate(
      pOSMachineId: json['POSMachineId'] as int?,
      pOSName: json['POSName'] as String?,
      legalEntity: json['LegalEntity'] as String?,
      remarks: json['Remarks'] as String?,
      friendlyName: json['FriendlyName'] as String?,
      pOSTypeId: json['POSTypeId'] as int?,
      inventoryLocationId: json['InventoryLocationId'] as int?,
      iPAddress: json['IPAddress'] as String?,
      computerName: json['ComputerName'] as String?,
      guid: json['Guid'] as String?,
      siteId: json['SiteId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      masterEntityId: json['MasterEntityId'] as int?,
      dayBeginTime: json['DayBeginTime'] as String?,
      dayEndTime: json['DayEndTime'] as String?,
      xReportRunTime: json['XReportRunTime'] as String?,
      isActive: json['IsActive'] as bool?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      attribute1: json['Attribute1'] as String?,
      attribute2: json['Attribute2'] as String?,
      attribute3: json['Attribute3'] as String?,
      attribute4: json['Attribute4'] as String?,
      attribute5: json['Attribute5'] as String?,
      isChanged: json['IsChanged'] as bool?,
      productMenuPosMachineMapDto: (json['ProductMenuPOSMachineMapDTOList']
              as List<dynamic>?)
          ?.map((e) =>
              ProductMenuPosMachineMapDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_PosMachineDateToJson(_$_PosMachineDate instance) =>
    <String, dynamic>{
      'POSMachineId': instance.pOSMachineId,
      'POSName': instance.pOSName,
      'LegalEntity': instance.legalEntity,
      'Remarks': instance.remarks,
      'FriendlyName': instance.friendlyName,
      'POSTypeId': instance.pOSTypeId,
      'InventoryLocationId': instance.inventoryLocationId,
      'IPAddress': instance.iPAddress,
      'ComputerName': instance.computerName,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'DayBeginTime': instance.dayBeginTime,
      'DayEndTime': instance.dayEndTime,
      'XReportRunTime': instance.xReportRunTime,
      'IsActive': instance.isActive,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'Attribute1': instance.attribute1,
      'Attribute2': instance.attribute2,
      'Attribute3': instance.attribute3,
      'Attribute4': instance.attribute4,
      'Attribute5': instance.attribute5,
      'IsChanged': instance.isChanged,
      'ProductMenuPOSMachineMapDTOList': instance.productMenuPosMachineMapDto,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
