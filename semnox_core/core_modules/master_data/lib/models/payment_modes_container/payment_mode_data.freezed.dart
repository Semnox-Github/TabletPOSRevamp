// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_mode_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModesData _$PaymentModesDataFromJson(Map<String, dynamic> json) {
  return _PaymentModesData.fromJson(json);
}

/// @nodoc
mixin _$PaymentModesData {
  @JsonKey(name: 'PaymentModeContainerDTOList')
  List<PaymentModeContainerDTO> get paymentModeContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModesDataCopyWith<PaymentModesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModesDataCopyWith<$Res> {
  factory $PaymentModesDataCopyWith(
          PaymentModesData value, $Res Function(PaymentModesData) then) =
      _$PaymentModesDataCopyWithImpl<$Res, PaymentModesData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentModeContainerDTOList')
          List<PaymentModeContainerDTO> paymentModeContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$PaymentModesDataCopyWithImpl<$Res, $Val extends PaymentModesData>
    implements $PaymentModesDataCopyWith<$Res> {
  _$PaymentModesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentModeContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      paymentModeContainerDTOList: null == paymentModeContainerDTOList
          ? _value.paymentModeContainerDTOList
          : paymentModeContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<PaymentModeContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentModesDataCopyWith<$Res>
    implements $PaymentModesDataCopyWith<$Res> {
  factory _$$_PaymentModesDataCopyWith(
          _$_PaymentModesData value, $Res Function(_$_PaymentModesData) then) =
      __$$_PaymentModesDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentModeContainerDTOList')
          List<PaymentModeContainerDTO> paymentModeContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_PaymentModesDataCopyWithImpl<$Res>
    extends _$PaymentModesDataCopyWithImpl<$Res, _$_PaymentModesData>
    implements _$$_PaymentModesDataCopyWith<$Res> {
  __$$_PaymentModesDataCopyWithImpl(
      _$_PaymentModesData _value, $Res Function(_$_PaymentModesData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentModeContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_PaymentModesData(
      paymentModeContainerDTOList: null == paymentModeContainerDTOList
          ? _value._paymentModeContainerDTOList
          : paymentModeContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<PaymentModeContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentModesData implements _PaymentModesData {
  const _$_PaymentModesData(
      {@JsonKey(name: 'PaymentModeContainerDTOList')
          required final List<PaymentModeContainerDTO>
              paymentModeContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _paymentModeContainerDTOList = paymentModeContainerDTOList;

  factory _$_PaymentModesData.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentModesDataFromJson(json);

  final List<PaymentModeContainerDTO> _paymentModeContainerDTOList;
  @override
  @JsonKey(name: 'PaymentModeContainerDTOList')
  List<PaymentModeContainerDTO> get paymentModeContainerDTOList {
    if (_paymentModeContainerDTOList is EqualUnmodifiableListView)
      return _paymentModeContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentModeContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'PaymentModesData(paymentModeContainerDTOList: $paymentModeContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentModesData &&
            const DeepCollectionEquality().equals(
                other._paymentModeContainerDTOList,
                _paymentModeContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_paymentModeContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentModesDataCopyWith<_$_PaymentModesData> get copyWith =>
      __$$_PaymentModesDataCopyWithImpl<_$_PaymentModesData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentModesDataToJson(
      this,
    );
  }
}

abstract class _PaymentModesData implements PaymentModesData {
  const factory _PaymentModesData(
      {@JsonKey(name: 'PaymentModeContainerDTOList')
          required final List<PaymentModeContainerDTO>
              paymentModeContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_PaymentModesData;

  factory _PaymentModesData.fromJson(Map<String, dynamic> json) =
      _$_PaymentModesData.fromJson;

  @override
  @JsonKey(name: 'PaymentModeContainerDTOList')
  List<PaymentModeContainerDTO> get paymentModeContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentModesDataCopyWith<_$_PaymentModesData> get copyWith =>
      throw _privateConstructorUsedError;
}
