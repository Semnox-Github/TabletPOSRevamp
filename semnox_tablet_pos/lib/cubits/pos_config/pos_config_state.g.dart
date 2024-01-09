// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_config_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PosConfigState _$$_PosConfigStateFromJson(Map<String, dynamic> json) =>
    _$_PosConfigState(
      loadingStatus: json['loadingStatus'] as int? ?? -1,
      isServerValidated: json['isServerValidated'] as bool? ?? false,
      sites: (json['sites'] as List<dynamic>?)
              ?.map((e) => SiteDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isServerErrorsPresent: json['isServerErrorsPresent'] as bool? ?? false,
      loginResponse: json['loginResponse'] == null
          ? null
          : SystemUserLoginResponse.fromJson(
              json['loginResponse'] as Map<String, dynamic>),
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
    );

Map<String, dynamic> _$$_PosConfigStateToJson(_$_PosConfigState instance) =>
    <String, dynamic>{
      'loadingStatus': instance.loadingStatus,
      'isServerValidated': instance.isServerValidated,
      'sites': instance.sites,
      'isServerErrorsPresent': instance.isServerErrorsPresent,
      'loginResponse': instance.loginResponse,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
    };
