// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteList _$$_SiteListFromJson(Map<String, dynamic> json) => _$_SiteList(
      siteContainerDTOList: (json['SiteContainerDTOList'] as List<dynamic>)
          .map((e) => SiteDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String,
    );

Map<String, dynamic> _$$_SiteListToJson(_$_SiteList instance) =>
    <String, dynamic>{
      'SiteContainerDTOList': instance.siteContainerDTOList,
      'Hash': instance.hash,
    };
