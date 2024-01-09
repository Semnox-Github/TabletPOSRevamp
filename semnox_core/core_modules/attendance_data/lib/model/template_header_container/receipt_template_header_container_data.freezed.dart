// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_template_header_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptTemplateHeaderContainerData _$ReceiptTemplateHeaderContainerDataFromJson(
    Map<String, dynamic> json) {
  return _ReceiptTemplateHeaderContainerData.fromJson(json);
}

/// @nodoc
mixin _$ReceiptTemplateHeaderContainerData {
  @JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
  List<ReceiptTemplateHeaderContainerDTO>
      get receiptPrintTemplateHeaderContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptTemplateHeaderContainerDataCopyWith<
          ReceiptTemplateHeaderContainerData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptTemplateHeaderContainerDataCopyWith<$Res> {
  factory $ReceiptTemplateHeaderContainerDataCopyWith(
          ReceiptTemplateHeaderContainerData value,
          $Res Function(ReceiptTemplateHeaderContainerData) then) =
      _$ReceiptTemplateHeaderContainerDataCopyWithImpl<$Res,
          ReceiptTemplateHeaderContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
          List<ReceiptTemplateHeaderContainerDTO>
              receiptPrintTemplateHeaderContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$ReceiptTemplateHeaderContainerDataCopyWithImpl<$Res,
        $Val extends ReceiptTemplateHeaderContainerData>
    implements $ReceiptTemplateHeaderContainerDataCopyWith<$Res> {
  _$ReceiptTemplateHeaderContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptPrintTemplateHeaderContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      receiptPrintTemplateHeaderContainerDTOList: null ==
              receiptPrintTemplateHeaderContainerDTOList
          ? _value.receiptPrintTemplateHeaderContainerDTOList
          : receiptPrintTemplateHeaderContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptTemplateHeaderContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiptTemplateHeaderContainerDataCopyWith<$Res>
    implements $ReceiptTemplateHeaderContainerDataCopyWith<$Res> {
  factory _$$_ReceiptTemplateHeaderContainerDataCopyWith(
          _$_ReceiptTemplateHeaderContainerData value,
          $Res Function(_$_ReceiptTemplateHeaderContainerData) then) =
      __$$_ReceiptTemplateHeaderContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
          List<ReceiptTemplateHeaderContainerDTO>
              receiptPrintTemplateHeaderContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_ReceiptTemplateHeaderContainerDataCopyWithImpl<$Res>
    extends _$ReceiptTemplateHeaderContainerDataCopyWithImpl<$Res,
        _$_ReceiptTemplateHeaderContainerData>
    implements _$$_ReceiptTemplateHeaderContainerDataCopyWith<$Res> {
  __$$_ReceiptTemplateHeaderContainerDataCopyWithImpl(
      _$_ReceiptTemplateHeaderContainerData _value,
      $Res Function(_$_ReceiptTemplateHeaderContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptPrintTemplateHeaderContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_ReceiptTemplateHeaderContainerData(
      receiptPrintTemplateHeaderContainerDTOList: null ==
              receiptPrintTemplateHeaderContainerDTOList
          ? _value._receiptPrintTemplateHeaderContainerDTOList
          : receiptPrintTemplateHeaderContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptTemplateHeaderContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptTemplateHeaderContainerData
    implements _ReceiptTemplateHeaderContainerData {
  const _$_ReceiptTemplateHeaderContainerData(
      {@JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
          required final List<ReceiptTemplateHeaderContainerDTO>
              receiptPrintTemplateHeaderContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _receiptPrintTemplateHeaderContainerDTOList =
            receiptPrintTemplateHeaderContainerDTOList;

  factory _$_ReceiptTemplateHeaderContainerData.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReceiptTemplateHeaderContainerDataFromJson(json);

  final List<ReceiptTemplateHeaderContainerDTO>
      _receiptPrintTemplateHeaderContainerDTOList;
  @override
  @JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
  List<ReceiptTemplateHeaderContainerDTO>
      get receiptPrintTemplateHeaderContainerDTOList {
    if (_receiptPrintTemplateHeaderContainerDTOList
        is EqualUnmodifiableListView)
      return _receiptPrintTemplateHeaderContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(
        _receiptPrintTemplateHeaderContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'ReceiptTemplateHeaderContainerData(receiptPrintTemplateHeaderContainerDTOList: $receiptPrintTemplateHeaderContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptTemplateHeaderContainerData &&
            const DeepCollectionEquality().equals(
                other._receiptPrintTemplateHeaderContainerDTOList,
                _receiptPrintTemplateHeaderContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality()
          .hash(_receiptPrintTemplateHeaderContainerDTOList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptTemplateHeaderContainerDataCopyWith<
          _$_ReceiptTemplateHeaderContainerData>
      get copyWith => __$$_ReceiptTemplateHeaderContainerDataCopyWithImpl<
          _$_ReceiptTemplateHeaderContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptTemplateHeaderContainerDataToJson(
      this,
    );
  }
}

abstract class _ReceiptTemplateHeaderContainerData
    implements ReceiptTemplateHeaderContainerData {
  const factory _ReceiptTemplateHeaderContainerData(
      {@JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
          required final List<ReceiptTemplateHeaderContainerDTO>
              receiptPrintTemplateHeaderContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_ReceiptTemplateHeaderContainerData;

  factory _ReceiptTemplateHeaderContainerData.fromJson(
          Map<String, dynamic> json) =
      _$_ReceiptTemplateHeaderContainerData.fromJson;

  @override
  @JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
  List<ReceiptTemplateHeaderContainerDTO>
      get receiptPrintTemplateHeaderContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptTemplateHeaderContainerDataCopyWith<
          _$_ReceiptTemplateHeaderContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
