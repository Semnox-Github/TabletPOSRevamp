// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuDto _$$_MenuDtoFromJson(Map<String, dynamic> json) => _$_MenuDto(
      menuId: json['MenuId'] as int?,
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      type: json['Type'] as String?,
      startDate: json['StartDate'] as String?,
      endDate: json['EndDate'] as String?,
      isActive: json['IsActive'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      productMenuPanelMappingDtoList: (json['ProductMenuPanelMappingDTOList']
              as List<dynamic>?)
          ?.map((e) =>
              ProductMenuPanelMappingDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChanged: json['IsChanged'] as bool?,
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_MenuDtoToJson(_$_MenuDto instance) =>
    <String, dynamic>{
      'MenuId': instance.menuId,
      'Name': instance.name,
      'Description': instance.description,
      'Type': instance.type,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'ProductMenuPanelMappingDTOList': instance.productMenuPanelMappingDtoList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
