// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_status_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransacationStatusContainerData _$TransacationStatusContainerDataFromJson(
    Map<String, dynamic> json) {
  return _TransacationStatusContainerData.fromJson(json);
}

/// @nodoc
mixin _$TransacationStatusContainerData {
  @JsonKey(name: 'TransactionStatusContainerDTOList')
  List<TransactionStatusContainerDTO> get transactionStatusContainerDTO =>
      throw _privateConstructorUsedError;
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransacationStatusContainerDataCopyWith<TransacationStatusContainerData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransacationStatusContainerDataCopyWith<$Res> {
  factory $TransacationStatusContainerDataCopyWith(
          TransacationStatusContainerData value,
          $Res Function(TransacationStatusContainerData) then) =
      _$TransacationStatusContainerDataCopyWithImpl<$Res,
          TransacationStatusContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionStatusContainerDTOList')
          List<TransactionStatusContainerDTO> transactionStatusContainerDTO,
      String? hash});
}

/// @nodoc
class _$TransacationStatusContainerDataCopyWithImpl<$Res,
        $Val extends TransacationStatusContainerData>
    implements $TransacationStatusContainerDataCopyWith<$Res> {
  _$TransacationStatusContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionStatusContainerDTO = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      transactionStatusContainerDTO: null == transactionStatusContainerDTO
          ? _value.transactionStatusContainerDTO
          : transactionStatusContainerDTO // ignore: cast_nullable_to_non_nullable
              as List<TransactionStatusContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransacationStatusContainerDataCopyWith<$Res>
    implements $TransacationStatusContainerDataCopyWith<$Res> {
  factory _$$_TransacationStatusContainerDataCopyWith(
          _$_TransacationStatusContainerData value,
          $Res Function(_$_TransacationStatusContainerData) then) =
      __$$_TransacationStatusContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionStatusContainerDTOList')
          List<TransactionStatusContainerDTO> transactionStatusContainerDTO,
      String? hash});
}

/// @nodoc
class __$$_TransacationStatusContainerDataCopyWithImpl<$Res>
    extends _$TransacationStatusContainerDataCopyWithImpl<$Res,
        _$_TransacationStatusContainerData>
    implements _$$_TransacationStatusContainerDataCopyWith<$Res> {
  __$$_TransacationStatusContainerDataCopyWithImpl(
      _$_TransacationStatusContainerData _value,
      $Res Function(_$_TransacationStatusContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionStatusContainerDTO = null,
    Object? hash = freezed,
  }) {
    return _then(_$_TransacationStatusContainerData(
      transactionStatusContainerDTO: null == transactionStatusContainerDTO
          ? _value._transactionStatusContainerDTO
          : transactionStatusContainerDTO // ignore: cast_nullable_to_non_nullable
              as List<TransactionStatusContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransacationStatusContainerData
    implements _TransacationStatusContainerData {
  const _$_TransacationStatusContainerData(
      {@JsonKey(name: 'TransactionStatusContainerDTOList')
          required final List<TransactionStatusContainerDTO>
              transactionStatusContainerDTO,
      this.hash})
      : _transactionStatusContainerDTO = transactionStatusContainerDTO;

  factory _$_TransacationStatusContainerData.fromJson(
          Map<String, dynamic> json) =>
      _$$_TransacationStatusContainerDataFromJson(json);

  final List<TransactionStatusContainerDTO> _transactionStatusContainerDTO;
  @override
  @JsonKey(name: 'TransactionStatusContainerDTOList')
  List<TransactionStatusContainerDTO> get transactionStatusContainerDTO {
    if (_transactionStatusContainerDTO is EqualUnmodifiableListView)
      return _transactionStatusContainerDTO;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionStatusContainerDTO);
  }

  @override
  final String? hash;

  @override
  String toString() {
    return 'TransacationStatusContainerData(transactionStatusContainerDTO: $transactionStatusContainerDTO, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransacationStatusContainerData &&
            const DeepCollectionEquality().equals(
                other._transactionStatusContainerDTO,
                _transactionStatusContainerDTO) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionStatusContainerDTO),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransacationStatusContainerDataCopyWith<
          _$_TransacationStatusContainerData>
      get copyWith => __$$_TransacationStatusContainerDataCopyWithImpl<
          _$_TransacationStatusContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransacationStatusContainerDataToJson(
      this,
    );
  }
}

abstract class _TransacationStatusContainerData
    implements TransacationStatusContainerData {
  const factory _TransacationStatusContainerData(
      {@JsonKey(name: 'TransactionStatusContainerDTOList')
          required final List<TransactionStatusContainerDTO>
              transactionStatusContainerDTO,
      final String? hash}) = _$_TransacationStatusContainerData;

  factory _TransacationStatusContainerData.fromJson(Map<String, dynamic> json) =
      _$_TransacationStatusContainerData.fromJson;

  @override
  @JsonKey(name: 'TransactionStatusContainerDTOList')
  List<TransactionStatusContainerDTO> get transactionStatusContainerDTO;
  @override
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_TransacationStatusContainerDataCopyWith<
          _$_TransacationStatusContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
