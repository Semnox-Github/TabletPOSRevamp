// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_delivery_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteDeliveryDetailsDTO _$SiteDeliveryDetailsDTOFromJson(
    Map<String, dynamic> json) {
  return _SiteDeliveryDetailsDTO.fromJson(json);
}

/// @nodoc
mixin _$SiteDeliveryDetailsDTO {
  @JsonKey(name: 'DeliveryChannelId')
  int? get deliveryChannelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteDetailId')
  int? get siteDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentSiteId')
  int? get parentSiteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnlineChannelStartHour')
  double? get onlineChannelStartHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnlineChannelEndHour')
  double? get onlineChannelEndHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderDeliveryType')
  String? get orderDeliveryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZipCodes')
  List<String>? get zipCodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int? get siteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteDeliveryDetailsDTOCopyWith<SiteDeliveryDetailsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteDeliveryDetailsDTOCopyWith<$Res> {
  factory $SiteDeliveryDetailsDTOCopyWith(SiteDeliveryDetailsDTO value,
          $Res Function(SiteDeliveryDetailsDTO) then) =
      _$SiteDeliveryDetailsDTOCopyWithImpl<$Res, SiteDeliveryDetailsDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DeliveryChannelId') int? deliveryChannelId,
      @JsonKey(name: 'SiteDetailId') int? siteDetailId,
      @JsonKey(name: 'ParentSiteId') int? parentSiteId,
      @JsonKey(name: 'OnlineChannelStartHour') double? onlineChannelStartHour,
      @JsonKey(name: 'OnlineChannelEndHour') double? onlineChannelEndHour,
      @JsonKey(name: 'OrderDeliveryType') String? orderDeliveryType,
      @JsonKey(name: 'ZipCodes') List<String>? zipCodes,
      @JsonKey(name: 'SiteId') int? siteId});
}

/// @nodoc
class _$SiteDeliveryDetailsDTOCopyWithImpl<$Res,
        $Val extends SiteDeliveryDetailsDTO>
    implements $SiteDeliveryDetailsDTOCopyWith<$Res> {
  _$SiteDeliveryDetailsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryChannelId = freezed,
    Object? siteDetailId = freezed,
    Object? parentSiteId = freezed,
    Object? onlineChannelStartHour = freezed,
    Object? onlineChannelEndHour = freezed,
    Object? orderDeliveryType = freezed,
    Object? zipCodes = freezed,
    Object? siteId = freezed,
  }) {
    return _then(_value.copyWith(
      deliveryChannelId: freezed == deliveryChannelId
          ? _value.deliveryChannelId
          : deliveryChannelId // ignore: cast_nullable_to_non_nullable
              as int?,
      siteDetailId: freezed == siteDetailId
          ? _value.siteDetailId
          : siteDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentSiteId: freezed == parentSiteId
          ? _value.parentSiteId
          : parentSiteId // ignore: cast_nullable_to_non_nullable
              as int?,
      onlineChannelStartHour: freezed == onlineChannelStartHour
          ? _value.onlineChannelStartHour
          : onlineChannelStartHour // ignore: cast_nullable_to_non_nullable
              as double?,
      onlineChannelEndHour: freezed == onlineChannelEndHour
          ? _value.onlineChannelEndHour
          : onlineChannelEndHour // ignore: cast_nullable_to_non_nullable
              as double?,
      orderDeliveryType: freezed == orderDeliveryType
          ? _value.orderDeliveryType
          : orderDeliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCodes: freezed == zipCodes
          ? _value.zipCodes
          : zipCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SiteDeliveryDetailsDTOCopyWith<$Res>
    implements $SiteDeliveryDetailsDTOCopyWith<$Res> {
  factory _$$_SiteDeliveryDetailsDTOCopyWith(_$_SiteDeliveryDetailsDTO value,
          $Res Function(_$_SiteDeliveryDetailsDTO) then) =
      __$$_SiteDeliveryDetailsDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DeliveryChannelId') int? deliveryChannelId,
      @JsonKey(name: 'SiteDetailId') int? siteDetailId,
      @JsonKey(name: 'ParentSiteId') int? parentSiteId,
      @JsonKey(name: 'OnlineChannelStartHour') double? onlineChannelStartHour,
      @JsonKey(name: 'OnlineChannelEndHour') double? onlineChannelEndHour,
      @JsonKey(name: 'OrderDeliveryType') String? orderDeliveryType,
      @JsonKey(name: 'ZipCodes') List<String>? zipCodes,
      @JsonKey(name: 'SiteId') int? siteId});
}

/// @nodoc
class __$$_SiteDeliveryDetailsDTOCopyWithImpl<$Res>
    extends _$SiteDeliveryDetailsDTOCopyWithImpl<$Res,
        _$_SiteDeliveryDetailsDTO>
    implements _$$_SiteDeliveryDetailsDTOCopyWith<$Res> {
  __$$_SiteDeliveryDetailsDTOCopyWithImpl(_$_SiteDeliveryDetailsDTO _value,
      $Res Function(_$_SiteDeliveryDetailsDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryChannelId = freezed,
    Object? siteDetailId = freezed,
    Object? parentSiteId = freezed,
    Object? onlineChannelStartHour = freezed,
    Object? onlineChannelEndHour = freezed,
    Object? orderDeliveryType = freezed,
    Object? zipCodes = freezed,
    Object? siteId = freezed,
  }) {
    return _then(_$_SiteDeliveryDetailsDTO(
      deliveryChannelId: freezed == deliveryChannelId
          ? _value.deliveryChannelId
          : deliveryChannelId // ignore: cast_nullable_to_non_nullable
              as int?,
      siteDetailId: freezed == siteDetailId
          ? _value.siteDetailId
          : siteDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentSiteId: freezed == parentSiteId
          ? _value.parentSiteId
          : parentSiteId // ignore: cast_nullable_to_non_nullable
              as int?,
      onlineChannelStartHour: freezed == onlineChannelStartHour
          ? _value.onlineChannelStartHour
          : onlineChannelStartHour // ignore: cast_nullable_to_non_nullable
              as double?,
      onlineChannelEndHour: freezed == onlineChannelEndHour
          ? _value.onlineChannelEndHour
          : onlineChannelEndHour // ignore: cast_nullable_to_non_nullable
              as double?,
      orderDeliveryType: freezed == orderDeliveryType
          ? _value.orderDeliveryType
          : orderDeliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCodes: freezed == zipCodes
          ? _value._zipCodes
          : zipCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SiteDeliveryDetailsDTO
    with DiagnosticableTreeMixin
    implements _SiteDeliveryDetailsDTO {
  const _$_SiteDeliveryDetailsDTO(
      {@JsonKey(name: 'DeliveryChannelId') this.deliveryChannelId,
      @JsonKey(name: 'SiteDetailId') this.siteDetailId,
      @JsonKey(name: 'ParentSiteId') this.parentSiteId,
      @JsonKey(name: 'OnlineChannelStartHour') this.onlineChannelStartHour,
      @JsonKey(name: 'OnlineChannelEndHour') this.onlineChannelEndHour,
      @JsonKey(name: 'OrderDeliveryType') this.orderDeliveryType,
      @JsonKey(name: 'ZipCodes') final List<String>? zipCodes,
      @JsonKey(name: 'SiteId') this.siteId})
      : _zipCodes = zipCodes;

  factory _$_SiteDeliveryDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SiteDeliveryDetailsDTOFromJson(json);

  @override
  @JsonKey(name: 'DeliveryChannelId')
  final int? deliveryChannelId;
  @override
  @JsonKey(name: 'SiteDetailId')
  final int? siteDetailId;
  @override
  @JsonKey(name: 'ParentSiteId')
  final int? parentSiteId;
  @override
  @JsonKey(name: 'OnlineChannelStartHour')
  final double? onlineChannelStartHour;
  @override
  @JsonKey(name: 'OnlineChannelEndHour')
  final double? onlineChannelEndHour;
  @override
  @JsonKey(name: 'OrderDeliveryType')
  final String? orderDeliveryType;
  final List<String>? _zipCodes;
  @override
  @JsonKey(name: 'ZipCodes')
  List<String>? get zipCodes {
    final value = _zipCodes;
    if (value == null) return null;
    if (_zipCodes is EqualUnmodifiableListView) return _zipCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'SiteId')
  final int? siteId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SiteDeliveryDetailsDTO(deliveryChannelId: $deliveryChannelId, siteDetailId: $siteDetailId, parentSiteId: $parentSiteId, onlineChannelStartHour: $onlineChannelStartHour, onlineChannelEndHour: $onlineChannelEndHour, orderDeliveryType: $orderDeliveryType, zipCodes: $zipCodes, siteId: $siteId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SiteDeliveryDetailsDTO'))
      ..add(DiagnosticsProperty('deliveryChannelId', deliveryChannelId))
      ..add(DiagnosticsProperty('siteDetailId', siteDetailId))
      ..add(DiagnosticsProperty('parentSiteId', parentSiteId))
      ..add(
          DiagnosticsProperty('onlineChannelStartHour', onlineChannelStartHour))
      ..add(DiagnosticsProperty('onlineChannelEndHour', onlineChannelEndHour))
      ..add(DiagnosticsProperty('orderDeliveryType', orderDeliveryType))
      ..add(DiagnosticsProperty('zipCodes', zipCodes))
      ..add(DiagnosticsProperty('siteId', siteId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SiteDeliveryDetailsDTO &&
            (identical(other.deliveryChannelId, deliveryChannelId) ||
                other.deliveryChannelId == deliveryChannelId) &&
            (identical(other.siteDetailId, siteDetailId) ||
                other.siteDetailId == siteDetailId) &&
            (identical(other.parentSiteId, parentSiteId) ||
                other.parentSiteId == parentSiteId) &&
            (identical(other.onlineChannelStartHour, onlineChannelStartHour) ||
                other.onlineChannelStartHour == onlineChannelStartHour) &&
            (identical(other.onlineChannelEndHour, onlineChannelEndHour) ||
                other.onlineChannelEndHour == onlineChannelEndHour) &&
            (identical(other.orderDeliveryType, orderDeliveryType) ||
                other.orderDeliveryType == orderDeliveryType) &&
            const DeepCollectionEquality().equals(other._zipCodes, _zipCodes) &&
            (identical(other.siteId, siteId) || other.siteId == siteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryChannelId,
      siteDetailId,
      parentSiteId,
      onlineChannelStartHour,
      onlineChannelEndHour,
      orderDeliveryType,
      const DeepCollectionEquality().hash(_zipCodes),
      siteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteDeliveryDetailsDTOCopyWith<_$_SiteDeliveryDetailsDTO> get copyWith =>
      __$$_SiteDeliveryDetailsDTOCopyWithImpl<_$_SiteDeliveryDetailsDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteDeliveryDetailsDTOToJson(
      this,
    );
  }
}

abstract class _SiteDeliveryDetailsDTO implements SiteDeliveryDetailsDTO {
  const factory _SiteDeliveryDetailsDTO(
      {@JsonKey(name: 'DeliveryChannelId')
          final int? deliveryChannelId,
      @JsonKey(name: 'SiteDetailId')
          final int? siteDetailId,
      @JsonKey(name: 'ParentSiteId')
          final int? parentSiteId,
      @JsonKey(name: 'OnlineChannelStartHour')
          final double? onlineChannelStartHour,
      @JsonKey(name: 'OnlineChannelEndHour')
          final double? onlineChannelEndHour,
      @JsonKey(name: 'OrderDeliveryType')
          final String? orderDeliveryType,
      @JsonKey(name: 'ZipCodes')
          final List<String>? zipCodes,
      @JsonKey(name: 'SiteId')
          final int? siteId}) = _$_SiteDeliveryDetailsDTO;

  factory _SiteDeliveryDetailsDTO.fromJson(Map<String, dynamic> json) =
      _$_SiteDeliveryDetailsDTO.fromJson;

  @override
  @JsonKey(name: 'DeliveryChannelId')
  int? get deliveryChannelId;
  @override
  @JsonKey(name: 'SiteDetailId')
  int? get siteDetailId;
  @override
  @JsonKey(name: 'ParentSiteId')
  int? get parentSiteId;
  @override
  @JsonKey(name: 'OnlineChannelStartHour')
  double? get onlineChannelStartHour;
  @override
  @JsonKey(name: 'OnlineChannelEndHour')
  double? get onlineChannelEndHour;
  @override
  @JsonKey(name: 'OrderDeliveryType')
  String? get orderDeliveryType;
  @override
  @JsonKey(name: 'ZipCodes')
  List<String>? get zipCodes;
  @override
  @JsonKey(name: 'SiteId')
  int? get siteId;
  @override
  @JsonKey(ignore: true)
  _$$_SiteDeliveryDetailsDTOCopyWith<_$_SiteDeliveryDetailsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
