// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serial_number_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardSerialNumberData _$$_CardSerialNumberDataFromJson(
        Map<String, dynamic> json) =>
    _$_CardSerialNumberData(
      tagSerialMappingId: json['TagSerialMappingId'] as int?,
      serialNumber: json['SerialNumber'] as String?,
      tagNumber: json['TagNumber'] as String?,
      issued: json['Issued'] as bool?,
      creationDate: json['CreationDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      status: json['Status'],
      message: json['Message'],
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      isChanged: json['IsChanged'] as bool?,
    );

Map<String, dynamic> _$$_CardSerialNumberDataToJson(
        _$_CardSerialNumberData instance) =>
    <String, dynamic>{
      'TagSerialMappingId': instance.tagSerialMappingId,
      'SerialNumber': instance.serialNumber,
      'TagNumber': instance.tagNumber,
      'Issued': instance.issued,
      'CreationDate': instance.creationDate,
      'CreatedBy': instance.createdBy,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'Status': instance.status,
      'Message': instance.message,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'IsChanged': instance.isChanged,
    };
