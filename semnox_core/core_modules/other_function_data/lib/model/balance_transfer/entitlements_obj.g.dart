// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlements_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entitlements _$$_EntitlementsFromJson(Map<String, dynamic> json) =>
    _$_Entitlements(
      bONUS: (json['BONUS'] as num?)?.toDouble(),
      cREDITS: (json['CREDITS'] as num?)?.toDouble(),
      tICKETS: (json['TICKETS'] as num?)?.toDouble(),
      cOURTESY: (json['COURTESY'] as num?)?.toDouble(),
      tIME: (json['TIME'] as num?)?.toDouble(),
      pLAYCREDITS: (json['PLAYCREDITS'] as num?)?.toDouble(),
      cOUNTERITEMS: (json['COUNTERITEMS'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_EntitlementsToJson(_$_Entitlements instance) =>
    <String, dynamic>{
      'BONUS': instance.bONUS,
      'CREDITS': instance.cREDITS,
      'TICKETS': instance.tICKETS,
      'COURTESY': instance.cOURTESY,
      'TIME': instance.tIME,
      'PLAYCREDITS': instance.pLAYCREDITS,
      'COUNTERITEMS': instance.cOUNTERITEMS,
    };
