// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lookup_values_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LookupValuesContainerDTO _$LookupValuesContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _LookupValuesContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$LookupValuesContainerDTO {
  @JsonKey(name: 'LookupValueId')
  int get lookupValueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LookupValue')
  String get lookupValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'LookupName')
  dynamic get lookupName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LookupValuesContainerDTOCopyWith<LookupValuesContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupValuesContainerDTOCopyWith<$Res> {
  factory $LookupValuesContainerDTOCopyWith(LookupValuesContainerDTO value,
          $Res Function(LookupValuesContainerDTO) then) =
      _$LookupValuesContainerDTOCopyWithImpl<$Res, LookupValuesContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LookupValueId') int lookupValueId,
      @JsonKey(name: 'LookupValue') String lookupValue,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LookupName') dynamic lookupName});
}

/// @nodoc
class _$LookupValuesContainerDTOCopyWithImpl<$Res,
        $Val extends LookupValuesContainerDTO>
    implements $LookupValuesContainerDTOCopyWith<$Res> {
  _$LookupValuesContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookupValueId = null,
    Object? lookupValue = null,
    Object? description = null,
    Object? lookupName = freezed,
  }) {
    return _then(_value.copyWith(
      lookupValueId: null == lookupValueId
          ? _value.lookupValueId
          : lookupValueId // ignore: cast_nullable_to_non_nullable
              as int,
      lookupValue: null == lookupValue
          ? _value.lookupValue
          : lookupValue // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lookupName: freezed == lookupName
          ? _value.lookupName
          : lookupName // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LookupValuesContainerDTOCopyWith<$Res>
    implements $LookupValuesContainerDTOCopyWith<$Res> {
  factory _$$_LookupValuesContainerDTOCopyWith(
          _$_LookupValuesContainerDTO value,
          $Res Function(_$_LookupValuesContainerDTO) then) =
      __$$_LookupValuesContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LookupValueId') int lookupValueId,
      @JsonKey(name: 'LookupValue') String lookupValue,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LookupName') dynamic lookupName});
}

/// @nodoc
class __$$_LookupValuesContainerDTOCopyWithImpl<$Res>
    extends _$LookupValuesContainerDTOCopyWithImpl<$Res,
        _$_LookupValuesContainerDTO>
    implements _$$_LookupValuesContainerDTOCopyWith<$Res> {
  __$$_LookupValuesContainerDTOCopyWithImpl(_$_LookupValuesContainerDTO _value,
      $Res Function(_$_LookupValuesContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookupValueId = null,
    Object? lookupValue = null,
    Object? description = null,
    Object? lookupName = freezed,
  }) {
    return _then(_$_LookupValuesContainerDTO(
      lookupValueId: null == lookupValueId
          ? _value.lookupValueId
          : lookupValueId // ignore: cast_nullable_to_non_nullable
              as int,
      lookupValue: null == lookupValue
          ? _value.lookupValue
          : lookupValue // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lookupName: freezed == lookupName
          ? _value.lookupName
          : lookupName // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LookupValuesContainerDTO implements _LookupValuesContainerDTO {
  const _$_LookupValuesContainerDTO(
      {@JsonKey(name: 'LookupValueId') required this.lookupValueId,
      @JsonKey(name: 'LookupValue') required this.lookupValue,
      @JsonKey(name: 'Description') required this.description,
      @JsonKey(name: 'LookupName') this.lookupName});

  factory _$_LookupValuesContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LookupValuesContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'LookupValueId')
  final int lookupValueId;
  @override
  @JsonKey(name: 'LookupValue')
  final String lookupValue;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'LookupName')
  final dynamic lookupName;

  @override
  String toString() {
    return 'LookupValuesContainerDTO(lookupValueId: $lookupValueId, lookupValue: $lookupValue, description: $description, lookupName: $lookupName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LookupValuesContainerDTO &&
            (identical(other.lookupValueId, lookupValueId) ||
                other.lookupValueId == lookupValueId) &&
            (identical(other.lookupValue, lookupValue) ||
                other.lookupValue == lookupValue) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.lookupName, lookupName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lookupValueId, lookupValue,
      description, const DeepCollectionEquality().hash(lookupName));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LookupValuesContainerDTOCopyWith<_$_LookupValuesContainerDTO>
      get copyWith => __$$_LookupValuesContainerDTOCopyWithImpl<
          _$_LookupValuesContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LookupValuesContainerDTOToJson(
      this,
    );
  }
}

abstract class _LookupValuesContainerDTO implements LookupValuesContainerDTO {
  const factory _LookupValuesContainerDTO(
          {@JsonKey(name: 'LookupValueId') required final int lookupValueId,
          @JsonKey(name: 'LookupValue') required final String lookupValue,
          @JsonKey(name: 'Description') required final String description,
          @JsonKey(name: 'LookupName') final dynamic lookupName}) =
      _$_LookupValuesContainerDTO;

  factory _LookupValuesContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_LookupValuesContainerDTO.fromJson;

  @override
  @JsonKey(name: 'LookupValueId')
  int get lookupValueId;
  @override
  @JsonKey(name: 'LookupValue')
  String get lookupValue;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'LookupName')
  dynamic get lookupName;
  @override
  @JsonKey(ignore: true)
  _$$_LookupValuesContainerDTOCopyWith<_$_LookupValuesContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
