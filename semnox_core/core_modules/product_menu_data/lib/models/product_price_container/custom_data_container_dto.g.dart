// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_data_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomDataContainerDTO _$$_CustomDataContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CustomDataContainerDTO(
      customAttributeId: json['CustomAttributeId'] as int,
      name: json['Name'] as String,
      type: json['Type'] as String,
      customDataId: json['CustomDataId'] as int,
      customDataSetId: json['CustomDataSetId'] as int,
      value: json['Value'],
      customDataText: json['CustomDataText'] as String,
      customDataNumber: (json['CustomDataNumber'] as num?)?.toDouble(),
      customDataDate: json['CustomDataDate'],
      valueId: json['ValueId'] as int,
      customeDataSetGuid: json['CustomeDataSetGuid'],
      customeDataGuid: json['CustomeDataGuid'],
    );

Map<String, dynamic> _$$_CustomDataContainerDTOToJson(
        _$_CustomDataContainerDTO instance) =>
    <String, dynamic>{
      'CustomAttributeId': instance.customAttributeId,
      'Name': instance.name,
      'Type': instance.type,
      'CustomDataId': instance.customDataId,
      'CustomDataSetId': instance.customDataSetId,
      'Value': instance.value,
      'CustomDataText': instance.customDataText,
      'CustomDataNumber': instance.customDataNumber,
      'CustomDataDate': instance.customDataDate,
      'ValueId': instance.valueId,
      'CustomeDataSetGuid': instance.customeDataSetGuid,
      'CustomeDataGuid': instance.customeDataGuid,
    };
