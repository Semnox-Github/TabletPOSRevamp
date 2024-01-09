// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printers_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrintersDto _$$_PrintersDtoFromJson(Map<String, dynamic> json) =>
    _$_PrintersDto(
      printerProductId: json['PrinterProductId'] as int?,
      printerId: json['PrinterId'] as int?,
      productId: json['ProductId'] as int?,
      isActive: json['IsActive'] as bool?,
      creationDate: json['CreationDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      siteId: json['Site_Id'] as int?,
      guid: json['GUID'] as String?,
      synchStatus: json['SynchStatus'] as bool?,
      masterEntityId: json['MasterEntityId'] as int?,
      include: json['Include'] as bool?,
      isChanged: json['IsChanged'] as bool?,
      printerPrintGroupId: json['PrinterPrintGroupId'] as int?,
      printGroupId: json['PrintGroupId'] as int?,
    );

Map<String, dynamic> _$$_PrintersDtoToJson(_$_PrintersDto instance) =>
    <String, dynamic>{
      'PrinterProductId': instance.printerProductId,
      'PrinterId': instance.printerId,
      'ProductId': instance.productId,
      'IsActive': instance.isActive,
      'CreationDate': instance.creationDate,
      'CreatedBy': instance.createdBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'Site_Id': instance.siteId,
      'GUID': instance.guid,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'Include': instance.include,
      'IsChanged': instance.isChanged,
      'PrinterPrintGroupId': instance.printerPrintGroupId,
      'PrintGroupId': instance.printGroupId,
    };
