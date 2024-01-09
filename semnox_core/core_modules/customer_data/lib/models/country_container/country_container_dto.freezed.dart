// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryContainerDTO _$CountryContainerDTOFromJson(Map<String, dynamic> json) {
  return _CountryContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$CountryContainerDTO {
  @JsonKey(name: 'CountryId')
  int get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryName')
  String get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryCode')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'StateContainerDTOList')
  List<StateContainerDTO> get stateContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryContainerDTOCopyWith<CountryContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryContainerDTOCopyWith<$Res> {
  factory $CountryContainerDTOCopyWith(
          CountryContainerDTO value, $Res Function(CountryContainerDTO) then) =
      _$CountryContainerDTOCopyWithImpl<$Res, CountryContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CountryId')
          int countryId,
      @JsonKey(name: 'CountryName')
          String countryName,
      @JsonKey(name: 'CountryCode')
          String countryCode,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'StateContainerDTOList')
          List<StateContainerDTO> stateContainerDTOList});
}

/// @nodoc
class _$CountryContainerDTOCopyWithImpl<$Res, $Val extends CountryContainerDTO>
    implements $CountryContainerDTOCopyWith<$Res> {
  _$CountryContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryId = null,
    Object? countryName = null,
    Object? countryCode = null,
    Object? isActive = null,
    Object? stateContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      stateContainerDTOList: null == stateContainerDTOList
          ? _value.stateContainerDTOList
          : stateContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<StateContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryContainerDTOCopyWith<$Res>
    implements $CountryContainerDTOCopyWith<$Res> {
  factory _$$_CountryContainerDTOCopyWith(_$_CountryContainerDTO value,
          $Res Function(_$_CountryContainerDTO) then) =
      __$$_CountryContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CountryId')
          int countryId,
      @JsonKey(name: 'CountryName')
          String countryName,
      @JsonKey(name: 'CountryCode')
          String countryCode,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'StateContainerDTOList')
          List<StateContainerDTO> stateContainerDTOList});
}

/// @nodoc
class __$$_CountryContainerDTOCopyWithImpl<$Res>
    extends _$CountryContainerDTOCopyWithImpl<$Res, _$_CountryContainerDTO>
    implements _$$_CountryContainerDTOCopyWith<$Res> {
  __$$_CountryContainerDTOCopyWithImpl(_$_CountryContainerDTO _value,
      $Res Function(_$_CountryContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryId = null,
    Object? countryName = null,
    Object? countryCode = null,
    Object? isActive = null,
    Object? stateContainerDTOList = null,
  }) {
    return _then(_$_CountryContainerDTO(
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      stateContainerDTOList: null == stateContainerDTOList
          ? _value._stateContainerDTOList
          : stateContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<StateContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryContainerDTO implements _CountryContainerDTO {
  const _$_CountryContainerDTO(
      {@JsonKey(name: 'CountryId')
          required this.countryId,
      @JsonKey(name: 'CountryName')
          required this.countryName,
      @JsonKey(name: 'CountryCode')
          required this.countryCode,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'StateContainerDTOList')
          required final List<StateContainerDTO> stateContainerDTOList})
      : _stateContainerDTOList = stateContainerDTOList;

  factory _$_CountryContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CountryContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'CountryId')
  final int countryId;
  @override
  @JsonKey(name: 'CountryName')
  final String countryName;
  @override
  @JsonKey(name: 'CountryCode')
  final String countryCode;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  final List<StateContainerDTO> _stateContainerDTOList;
  @override
  @JsonKey(name: 'StateContainerDTOList')
  List<StateContainerDTO> get stateContainerDTOList {
    if (_stateContainerDTOList is EqualUnmodifiableListView)
      return _stateContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stateContainerDTOList);
  }

  @override
  String toString() {
    return 'CountryContainerDTO(countryId: $countryId, countryName: $countryName, countryCode: $countryCode, isActive: $isActive, stateContainerDTOList: $stateContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryContainerDTO &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._stateContainerDTOList, _stateContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryId,
      countryName,
      countryCode,
      isActive,
      const DeepCollectionEquality().hash(_stateContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryContainerDTOCopyWith<_$_CountryContainerDTO> get copyWith =>
      __$$_CountryContainerDTOCopyWithImpl<_$_CountryContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryContainerDTOToJson(
      this,
    );
  }
}

abstract class _CountryContainerDTO implements CountryContainerDTO {
  const factory _CountryContainerDTO(
          {@JsonKey(name: 'CountryId')
              required final int countryId,
          @JsonKey(name: 'CountryName')
              required final String countryName,
          @JsonKey(name: 'CountryCode')
              required final String countryCode,
          @JsonKey(name: 'IsActive')
              required final bool isActive,
          @JsonKey(name: 'StateContainerDTOList')
              required final List<StateContainerDTO> stateContainerDTOList}) =
      _$_CountryContainerDTO;

  factory _CountryContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_CountryContainerDTO.fromJson;

  @override
  @JsonKey(name: 'CountryId')
  int get countryId;
  @override
  @JsonKey(name: 'CountryName')
  String get countryName;
  @override
  @JsonKey(name: 'CountryCode')
  String get countryCode;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'StateContainerDTOList')
  List<StateContainerDTO> get stateContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_CountryContainerDTOCopyWith<_$_CountryContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
