// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryContainerData _$CountryContainerDataFromJson(Map<String, dynamic> json) {
  return _CountryContainerData.fromJson(json);
}

/// @nodoc
mixin _$CountryContainerData {
  @JsonKey(name: 'CountryContainerDTOList')
  List<CountryContainerDTO> get countryContainerDTOList =>
      throw _privateConstructorUsedError;
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryContainerDataCopyWith<CountryContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryContainerDataCopyWith<$Res> {
  factory $CountryContainerDataCopyWith(CountryContainerData value,
          $Res Function(CountryContainerData) then) =
      _$CountryContainerDataCopyWithImpl<$Res, CountryContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CountryContainerDTOList')
          List<CountryContainerDTO> countryContainerDTOList,
      String? hash});
}

/// @nodoc
class _$CountryContainerDataCopyWithImpl<$Res,
        $Val extends CountryContainerData>
    implements $CountryContainerDataCopyWith<$Res> {
  _$CountryContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      countryContainerDTOList: null == countryContainerDTOList
          ? _value.countryContainerDTOList
          : countryContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<CountryContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryContainerDataCopyWith<$Res>
    implements $CountryContainerDataCopyWith<$Res> {
  factory _$$_CountryContainerDataCopyWith(_$_CountryContainerData value,
          $Res Function(_$_CountryContainerData) then) =
      __$$_CountryContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CountryContainerDTOList')
          List<CountryContainerDTO> countryContainerDTOList,
      String? hash});
}

/// @nodoc
class __$$_CountryContainerDataCopyWithImpl<$Res>
    extends _$CountryContainerDataCopyWithImpl<$Res, _$_CountryContainerData>
    implements _$$_CountryContainerDataCopyWith<$Res> {
  __$$_CountryContainerDataCopyWithImpl(_$_CountryContainerData _value,
      $Res Function(_$_CountryContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_CountryContainerData(
      countryContainerDTOList: null == countryContainerDTOList
          ? _value._countryContainerDTOList
          : countryContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<CountryContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryContainerData implements _CountryContainerData {
  const _$_CountryContainerData(
      {@JsonKey(name: 'CountryContainerDTOList')
          required final List<CountryContainerDTO> countryContainerDTOList,
      this.hash})
      : _countryContainerDTOList = countryContainerDTOList;

  factory _$_CountryContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_CountryContainerDataFromJson(json);

  final List<CountryContainerDTO> _countryContainerDTOList;
  @override
  @JsonKey(name: 'CountryContainerDTOList')
  List<CountryContainerDTO> get countryContainerDTOList {
    if (_countryContainerDTOList is EqualUnmodifiableListView)
      return _countryContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryContainerDTOList);
  }

  @override
  final String? hash;

  @override
  String toString() {
    return 'CountryContainerData(countryContainerDTOList: $countryContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryContainerData &&
            const DeepCollectionEquality().equals(
                other._countryContainerDTOList, _countryContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_countryContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryContainerDataCopyWith<_$_CountryContainerData> get copyWith =>
      __$$_CountryContainerDataCopyWithImpl<_$_CountryContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryContainerDataToJson(
      this,
    );
  }
}

abstract class _CountryContainerData implements CountryContainerData {
  const factory _CountryContainerData(
      {@JsonKey(name: 'CountryContainerDTOList')
          required final List<CountryContainerDTO> countryContainerDTOList,
      final String? hash}) = _$_CountryContainerData;

  factory _CountryContainerData.fromJson(Map<String, dynamic> json) =
      _$_CountryContainerData.fromJson;

  @override
  @JsonKey(name: 'CountryContainerDTOList')
  List<CountryContainerDTO> get countryContainerDTOList;
  @override
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_CountryContainerDataCopyWith<_$_CountryContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
