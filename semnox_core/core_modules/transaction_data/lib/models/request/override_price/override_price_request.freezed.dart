// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'override_price_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OverridePriceRequest _$OverridePriceRequestFromJson(Map<String, dynamic> json) {
  return _OverridePriceRequest.fromJson(json);
}

/// @nodoc
mixin _$OverridePriceRequest {
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'OverridePrice')
  double get overridePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverridePriceRequestCopyWith<OverridePriceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverridePriceRequestCopyWith<$Res> {
  factory $OverridePriceRequestCopyWith(OverridePriceRequest value,
          $Res Function(OverridePriceRequest) then) =
      _$OverridePriceRequestCopyWithImpl<$Res, OverridePriceRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineIdList') List<int> transactionLineIds,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'OverridePrice') double overridePrice,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDto});

  $ApprovalDTOCopyWith<$Res> get approvalDto;
}

/// @nodoc
class _$OverridePriceRequestCopyWithImpl<$Res,
        $Val extends OverridePriceRequest>
    implements $OverridePriceRequestCopyWith<$Res> {
  _$OverridePriceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineIds = null,
    Object? lineRemarks = null,
    Object? overridePrice = null,
    Object? approvalDto = null,
  }) {
    return _then(_value.copyWith(
      transactionLineIds: null == transactionLineIds
          ? _value.transactionLineIds
          : transactionLineIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
              as String,
      overridePrice: null == overridePrice
          ? _value.overridePrice
          : overridePrice // ignore: cast_nullable_to_non_nullable
              as double,
      approvalDto: null == approvalDto
          ? _value.approvalDto
          : approvalDto // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovalDTOCopyWith<$Res> get approvalDto {
    return $ApprovalDTOCopyWith<$Res>(_value.approvalDto, (value) {
      return _then(_value.copyWith(approvalDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OverridePriceRequestCopyWith<$Res>
    implements $OverridePriceRequestCopyWith<$Res> {
  factory _$$_OverridePriceRequestCopyWith(_$_OverridePriceRequest value,
          $Res Function(_$_OverridePriceRequest) then) =
      __$$_OverridePriceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineIdList') List<int> transactionLineIds,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'OverridePrice') double overridePrice,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDto});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDto;
}

/// @nodoc
class __$$_OverridePriceRequestCopyWithImpl<$Res>
    extends _$OverridePriceRequestCopyWithImpl<$Res, _$_OverridePriceRequest>
    implements _$$_OverridePriceRequestCopyWith<$Res> {
  __$$_OverridePriceRequestCopyWithImpl(_$_OverridePriceRequest _value,
      $Res Function(_$_OverridePriceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineIds = null,
    Object? lineRemarks = null,
    Object? overridePrice = null,
    Object? approvalDto = null,
  }) {
    return _then(_$_OverridePriceRequest(
      transactionLineIds: null == transactionLineIds
          ? _value._transactionLineIds
          : transactionLineIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
              as String,
      overridePrice: null == overridePrice
          ? _value.overridePrice
          : overridePrice // ignore: cast_nullable_to_non_nullable
              as double,
      approvalDto: null == approvalDto
          ? _value.approvalDto
          : approvalDto // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OverridePriceRequest implements _OverridePriceRequest {
  const _$_OverridePriceRequest(
      {@JsonKey(name: 'TransactionLineIdList')
          required final List<int> transactionLineIds,
      @JsonKey(name: 'LineRemarks')
          required this.lineRemarks,
      @JsonKey(name: 'OverridePrice')
          required this.overridePrice,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDto})
      : _transactionLineIds = transactionLineIds;

  factory _$_OverridePriceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_OverridePriceRequestFromJson(json);

  final List<int> _transactionLineIds;
  @override
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIds {
    if (_transactionLineIds is EqualUnmodifiableListView)
      return _transactionLineIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionLineIds);
  }

  @override
  @JsonKey(name: 'LineRemarks')
  final String lineRemarks;
  @override
  @JsonKey(name: 'OverridePrice')
  final double overridePrice;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDto;

  @override
  String toString() {
    return 'OverridePriceRequest(transactionLineIds: $transactionLineIds, lineRemarks: $lineRemarks, overridePrice: $overridePrice, approvalDto: $approvalDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverridePriceRequest &&
            const DeepCollectionEquality()
                .equals(other._transactionLineIds, _transactionLineIds) &&
            (identical(other.lineRemarks, lineRemarks) ||
                other.lineRemarks == lineRemarks) &&
            (identical(other.overridePrice, overridePrice) ||
                other.overridePrice == overridePrice) &&
            (identical(other.approvalDto, approvalDto) ||
                other.approvalDto == approvalDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionLineIds),
      lineRemarks,
      overridePrice,
      approvalDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OverridePriceRequestCopyWith<_$_OverridePriceRequest> get copyWith =>
      __$$_OverridePriceRequestCopyWithImpl<_$_OverridePriceRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OverridePriceRequestToJson(
      this,
    );
  }
}

abstract class _OverridePriceRequest implements OverridePriceRequest {
  const factory _OverridePriceRequest(
      {@JsonKey(name: 'TransactionLineIdList')
          required final List<int> transactionLineIds,
      @JsonKey(name: 'LineRemarks')
          required final String lineRemarks,
      @JsonKey(name: 'OverridePrice')
          required final double overridePrice,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDto}) = _$_OverridePriceRequest;

  factory _OverridePriceRequest.fromJson(Map<String, dynamic> json) =
      _$_OverridePriceRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineIdList')
  List<int> get transactionLineIds;
  @override
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks;
  @override
  @JsonKey(name: 'OverridePrice')
  double get overridePrice;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDto;
  @override
  @JsonKey(ignore: true)
  _$$_OverridePriceRequestCopyWith<_$_OverridePriceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
