// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parafait_default_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParafaitDefaultContainerDTO _$ParafaitDefaultContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ParafaitDefaultContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ParafaitDefaultContainerDTO {
  @JsonKey(name: 'DefaultValueName')
  String get defaultValueName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultValue')
  String get defaultValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParafaitDefaultContainerDTOCopyWith<ParafaitDefaultContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParafaitDefaultContainerDTOCopyWith<$Res> {
  factory $ParafaitDefaultContainerDTOCopyWith(
          ParafaitDefaultContainerDTO value,
          $Res Function(ParafaitDefaultContainerDTO) then) =
      _$ParafaitDefaultContainerDTOCopyWithImpl<$Res,
          ParafaitDefaultContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DefaultValueName') String defaultValueName,
      @JsonKey(name: 'DefaultValue') String defaultValue});
}

/// @nodoc
class _$ParafaitDefaultContainerDTOCopyWithImpl<$Res,
        $Val extends ParafaitDefaultContainerDTO>
    implements $ParafaitDefaultContainerDTOCopyWith<$Res> {
  _$ParafaitDefaultContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultValueName = null,
    Object? defaultValue = null,
  }) {
    return _then(_value.copyWith(
      defaultValueName: null == defaultValueName
          ? _value.defaultValueName
          : defaultValueName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParafaitDefaultContainerDTOCopyWith<$Res>
    implements $ParafaitDefaultContainerDTOCopyWith<$Res> {
  factory _$$_ParafaitDefaultContainerDTOCopyWith(
          _$_ParafaitDefaultContainerDTO value,
          $Res Function(_$_ParafaitDefaultContainerDTO) then) =
      __$$_ParafaitDefaultContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DefaultValueName') String defaultValueName,
      @JsonKey(name: 'DefaultValue') String defaultValue});
}

/// @nodoc
class __$$_ParafaitDefaultContainerDTOCopyWithImpl<$Res>
    extends _$ParafaitDefaultContainerDTOCopyWithImpl<$Res,
        _$_ParafaitDefaultContainerDTO>
    implements _$$_ParafaitDefaultContainerDTOCopyWith<$Res> {
  __$$_ParafaitDefaultContainerDTOCopyWithImpl(
      _$_ParafaitDefaultContainerDTO _value,
      $Res Function(_$_ParafaitDefaultContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultValueName = null,
    Object? defaultValue = null,
  }) {
    return _then(_$_ParafaitDefaultContainerDTO(
      defaultValueName: null == defaultValueName
          ? _value.defaultValueName
          : defaultValueName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParafaitDefaultContainerDTO implements _ParafaitDefaultContainerDTO {
  const _$_ParafaitDefaultContainerDTO(
      {@JsonKey(name: 'DefaultValueName') required this.defaultValueName,
      @JsonKey(name: 'DefaultValue') required this.defaultValue});

  factory _$_ParafaitDefaultContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ParafaitDefaultContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'DefaultValueName')
  final String defaultValueName;
  @override
  @JsonKey(name: 'DefaultValue')
  final String defaultValue;

  @override
  String toString() {
    return 'ParafaitDefaultContainerDTO(defaultValueName: $defaultValueName, defaultValue: $defaultValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParafaitDefaultContainerDTO &&
            (identical(other.defaultValueName, defaultValueName) ||
                other.defaultValueName == defaultValueName) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, defaultValueName, defaultValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParafaitDefaultContainerDTOCopyWith<_$_ParafaitDefaultContainerDTO>
      get copyWith => __$$_ParafaitDefaultContainerDTOCopyWithImpl<
          _$_ParafaitDefaultContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParafaitDefaultContainerDTOToJson(
      this,
    );
  }
}

abstract class _ParafaitDefaultContainerDTO
    implements ParafaitDefaultContainerDTO {
  const factory _ParafaitDefaultContainerDTO(
      {@JsonKey(name: 'DefaultValueName')
          required final String defaultValueName,
      @JsonKey(name: 'DefaultValue')
          required final String defaultValue}) = _$_ParafaitDefaultContainerDTO;

  factory _ParafaitDefaultContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_ParafaitDefaultContainerDTO.fromJson;

  @override
  @JsonKey(name: 'DefaultValueName')
  String get defaultValueName;
  @override
  @JsonKey(name: 'DefaultValue')
  String get defaultValue;
  @override
  @JsonKey(ignore: true)
  _$$_ParafaitDefaultContainerDTOCopyWith<_$_ParafaitDefaultContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
