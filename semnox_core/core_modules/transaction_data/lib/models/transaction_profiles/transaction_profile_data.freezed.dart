// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionProfileData _$TransactionProfileDataFromJson(
    Map<String, dynamic> json) {
  return _TransactionProfileData.fromJson(json);
}

/// @nodoc
mixin _$TransactionProfileData {
  @JsonKey(name: 'TransactionProfileContainerDTOList')
  List<TransactionProfileContainerDTO> get transactionProfileContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionProfileDataCopyWith<TransactionProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionProfileDataCopyWith<$Res> {
  factory $TransactionProfileDataCopyWith(TransactionProfileData value,
          $Res Function(TransactionProfileData) then) =
      _$TransactionProfileDataCopyWithImpl<$Res, TransactionProfileData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionProfileContainerDTOList')
          List<TransactionProfileContainerDTO>
              transactionProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$TransactionProfileDataCopyWithImpl<$Res,
        $Val extends TransactionProfileData>
    implements $TransactionProfileDataCopyWith<$Res> {
  _$TransactionProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionProfileContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      transactionProfileContainerDTOList: null ==
              transactionProfileContainerDTOList
          ? _value.transactionProfileContainerDTOList
          : transactionProfileContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionProfileContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionProfileDataCopyWith<$Res>
    implements $TransactionProfileDataCopyWith<$Res> {
  factory _$$_TransactionProfileDataCopyWith(_$_TransactionProfileData value,
          $Res Function(_$_TransactionProfileData) then) =
      __$$_TransactionProfileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionProfileContainerDTOList')
          List<TransactionProfileContainerDTO>
              transactionProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_TransactionProfileDataCopyWithImpl<$Res>
    extends _$TransactionProfileDataCopyWithImpl<$Res,
        _$_TransactionProfileData>
    implements _$$_TransactionProfileDataCopyWith<$Res> {
  __$$_TransactionProfileDataCopyWithImpl(_$_TransactionProfileData _value,
      $Res Function(_$_TransactionProfileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionProfileContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_TransactionProfileData(
      transactionProfileContainerDTOList: null ==
              transactionProfileContainerDTOList
          ? _value._transactionProfileContainerDTOList
          : transactionProfileContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionProfileContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionProfileData implements _TransactionProfileData {
  const _$_TransactionProfileData(
      {@JsonKey(name: 'TransactionProfileContainerDTOList')
          required final List<TransactionProfileContainerDTO>
              transactionProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _transactionProfileContainerDTOList =
            transactionProfileContainerDTOList;

  factory _$_TransactionProfileData.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionProfileDataFromJson(json);

  final List<TransactionProfileContainerDTO>
      _transactionProfileContainerDTOList;
  @override
  @JsonKey(name: 'TransactionProfileContainerDTOList')
  List<TransactionProfileContainerDTO> get transactionProfileContainerDTOList {
    if (_transactionProfileContainerDTOList is EqualUnmodifiableListView)
      return _transactionProfileContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionProfileContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'TransactionProfileData(transactionProfileContainerDTOList: $transactionProfileContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionProfileData &&
            const DeepCollectionEquality().equals(
                other._transactionProfileContainerDTOList,
                _transactionProfileContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionProfileContainerDTOList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionProfileDataCopyWith<_$_TransactionProfileData> get copyWith =>
      __$$_TransactionProfileDataCopyWithImpl<_$_TransactionProfileData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionProfileDataToJson(
      this,
    );
  }
}

abstract class _TransactionProfileData implements TransactionProfileData {
  const factory _TransactionProfileData(
      {@JsonKey(name: 'TransactionProfileContainerDTOList')
          required final List<TransactionProfileContainerDTO>
              transactionProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_TransactionProfileData;

  factory _TransactionProfileData.fromJson(Map<String, dynamic> json) =
      _$_TransactionProfileData.fromJson;

  @override
  @JsonKey(name: 'TransactionProfileContainerDTOList')
  List<TransactionProfileContainerDTO> get transactionProfileContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionProfileDataCopyWith<_$_TransactionProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}
