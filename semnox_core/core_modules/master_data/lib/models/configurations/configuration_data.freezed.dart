// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuration_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfigurationData _$ConfigurationDataFromJson(Map<String, dynamic> json) {
  return _ConfigurationData.fromJson(json);
}

/// @nodoc
mixin _$ConfigurationData {
  @JsonKey(name: 'ParafaitDefaultContainerDTOList')
  List<ParafaitDefaultContainerDTO> get parafaitDefaultContainerDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigurationDataCopyWith<ConfigurationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationDataCopyWith<$Res> {
  factory $ConfigurationDataCopyWith(
          ConfigurationData value, $Res Function(ConfigurationData) then) =
      _$ConfigurationDataCopyWithImpl<$Res, ConfigurationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ParafaitDefaultContainerDTOList')
          List<ParafaitDefaultContainerDTO> parafaitDefaultContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$ConfigurationDataCopyWithImpl<$Res, $Val extends ConfigurationData>
    implements $ConfigurationDataCopyWith<$Res> {
  _$ConfigurationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parafaitDefaultContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      parafaitDefaultContainerDtoList: null == parafaitDefaultContainerDtoList
          ? _value.parafaitDefaultContainerDtoList
          : parafaitDefaultContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ParafaitDefaultContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigurationDataCopyWith<$Res>
    implements $ConfigurationDataCopyWith<$Res> {
  factory _$$_ConfigurationDataCopyWith(_$_ConfigurationData value,
          $Res Function(_$_ConfigurationData) then) =
      __$$_ConfigurationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ParafaitDefaultContainerDTOList')
          List<ParafaitDefaultContainerDTO> parafaitDefaultContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_ConfigurationDataCopyWithImpl<$Res>
    extends _$ConfigurationDataCopyWithImpl<$Res, _$_ConfigurationData>
    implements _$$_ConfigurationDataCopyWith<$Res> {
  __$$_ConfigurationDataCopyWithImpl(
      _$_ConfigurationData _value, $Res Function(_$_ConfigurationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parafaitDefaultContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_ConfigurationData(
      parafaitDefaultContainerDtoList: null == parafaitDefaultContainerDtoList
          ? _value._parafaitDefaultContainerDtoList
          : parafaitDefaultContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ParafaitDefaultContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConfigurationData implements _ConfigurationData {
  const _$_ConfigurationData(
      {@JsonKey(name: 'ParafaitDefaultContainerDTOList')
          required final List<ParafaitDefaultContainerDTO>
              parafaitDefaultContainerDtoList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _parafaitDefaultContainerDtoList = parafaitDefaultContainerDtoList;

  factory _$_ConfigurationData.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigurationDataFromJson(json);

  final List<ParafaitDefaultContainerDTO> _parafaitDefaultContainerDtoList;
  @override
  @JsonKey(name: 'ParafaitDefaultContainerDTOList')
  List<ParafaitDefaultContainerDTO> get parafaitDefaultContainerDtoList {
    if (_parafaitDefaultContainerDtoList is EqualUnmodifiableListView)
      return _parafaitDefaultContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parafaitDefaultContainerDtoList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'ConfigurationData(parafaitDefaultContainerDtoList: $parafaitDefaultContainerDtoList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigurationData &&
            const DeepCollectionEquality().equals(
                other._parafaitDefaultContainerDtoList,
                _parafaitDefaultContainerDtoList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_parafaitDefaultContainerDtoList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigurationDataCopyWith<_$_ConfigurationData> get copyWith =>
      __$$_ConfigurationDataCopyWithImpl<_$_ConfigurationData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigurationDataToJson(
      this,
    );
  }
}

abstract class _ConfigurationData implements ConfigurationData {
  const factory _ConfigurationData(
      {@JsonKey(name: 'ParafaitDefaultContainerDTOList')
          required final List<ParafaitDefaultContainerDTO>
              parafaitDefaultContainerDtoList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_ConfigurationData;

  factory _ConfigurationData.fromJson(Map<String, dynamic> json) =
      _$_ConfigurationData.fromJson;

  @override
  @JsonKey(name: 'ParafaitDefaultContainerDTOList')
  List<ParafaitDefaultContainerDTO> get parafaitDefaultContainerDtoList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigurationDataCopyWith<_$_ConfigurationData> get copyWith =>
      throw _privateConstructorUsedError;
}
