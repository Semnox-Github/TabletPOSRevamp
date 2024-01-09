// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_container_snapshot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuContainerSnapshotDTO _$$_ProductMenuContainerSnapshotDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMenuContainerSnapshotDTO(
      startDateTime: json['StartDateTime'] as String,
      endDateTime: json['EndDateTime'] as String,
      productMenuPanelContainerDTOList:
          (json['ProductMenuPanelContainerDTOList'] as List<dynamic>)
              .map((e) => ProductMenuPanelContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_ProductMenuContainerSnapshotDTOToJson(
        _$_ProductMenuContainerSnapshotDTO instance) =>
    <String, dynamic>{
      'StartDateTime': instance.startDateTime,
      'EndDateTime': instance.endDateTime,
      'ProductMenuPanelContainerDTOList':
          instance.productMenuPanelContainerDTOList,
    };
