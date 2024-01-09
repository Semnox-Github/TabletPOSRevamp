// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_transaction_lines_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTransactionLinesRequest _$OrderTransactionLinesRequestFromJson(
    Map<String, dynamic> json) {
  return _OrderTransactionLinesRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderTransactionLinesRequest {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionAccountDTOList')
  List<TransactionLineAccountDto> get transactionAccountDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTransactionLinesRequestCopyWith<OrderTransactionLinesRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTransactionLinesRequestCopyWith<$Res> {
  factory $OrderTransactionLinesRequestCopyWith(
          OrderTransactionLinesRequest value,
          $Res Function(OrderTransactionLinesRequest) then) =
      _$OrderTransactionLinesRequestCopyWithImpl<$Res,
          OrderTransactionLinesRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId')
          int transactionLineId,
      @JsonKey(name: 'TransactionAccountDTOList')
          List<TransactionLineAccountDto> transactionAccountDtoList,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDto});

  $ApprovalDTOCopyWith<$Res> get approvalDto;
}

/// @nodoc
class _$OrderTransactionLinesRequestCopyWithImpl<$Res,
        $Val extends OrderTransactionLinesRequest>
    implements $OrderTransactionLinesRequestCopyWith<$Res> {
  _$OrderTransactionLinesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? transactionAccountDtoList = null,
    Object? approvalDto = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionAccountDtoList: null == transactionAccountDtoList
          ? _value.transactionAccountDtoList
          : transactionAccountDtoList // ignore: cast_nullable_to_non_nullable
              as List<TransactionLineAccountDto>,
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
abstract class _$$_OrderTransactionLinesRequestCopyWith<$Res>
    implements $OrderTransactionLinesRequestCopyWith<$Res> {
  factory _$$_OrderTransactionLinesRequestCopyWith(
          _$_OrderTransactionLinesRequest value,
          $Res Function(_$_OrderTransactionLinesRequest) then) =
      __$$_OrderTransactionLinesRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId')
          int transactionLineId,
      @JsonKey(name: 'TransactionAccountDTOList')
          List<TransactionLineAccountDto> transactionAccountDtoList,
      @JsonKey(name: 'ApprovalDTO')
          ApprovalDTO approvalDto});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDto;
}

/// @nodoc
class __$$_OrderTransactionLinesRequestCopyWithImpl<$Res>
    extends _$OrderTransactionLinesRequestCopyWithImpl<$Res,
        _$_OrderTransactionLinesRequest>
    implements _$$_OrderTransactionLinesRequestCopyWith<$Res> {
  __$$_OrderTransactionLinesRequestCopyWithImpl(
      _$_OrderTransactionLinesRequest _value,
      $Res Function(_$_OrderTransactionLinesRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? transactionAccountDtoList = null,
    Object? approvalDto = null,
  }) {
    return _then(_$_OrderTransactionLinesRequest(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionAccountDtoList: null == transactionAccountDtoList
          ? _value._transactionAccountDtoList
          : transactionAccountDtoList // ignore: cast_nullable_to_non_nullable
              as List<TransactionLineAccountDto>,
      approvalDto: null == approvalDto
          ? _value.approvalDto
          : approvalDto // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTransactionLinesRequest implements _OrderTransactionLinesRequest {
  const _$_OrderTransactionLinesRequest(
      {@JsonKey(name: 'TransactionLineId')
          required this.transactionLineId,
      @JsonKey(name: 'TransactionAccountDTOList')
          required final List<TransactionLineAccountDto>
              transactionAccountDtoList,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDto})
      : _transactionAccountDtoList = transactionAccountDtoList;

  factory _$_OrderTransactionLinesRequest.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTransactionLinesRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  final List<TransactionLineAccountDto> _transactionAccountDtoList;
  @override
  @JsonKey(name: 'TransactionAccountDTOList')
  List<TransactionLineAccountDto> get transactionAccountDtoList {
    if (_transactionAccountDtoList is EqualUnmodifiableListView)
      return _transactionAccountDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionAccountDtoList);
  }

  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDto;

  @override
  String toString() {
    return 'OrderTransactionLinesRequest(transactionLineId: $transactionLineId, transactionAccountDtoList: $transactionAccountDtoList, approvalDto: $approvalDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTransactionLinesRequest &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            const DeepCollectionEquality().equals(
                other._transactionAccountDtoList, _transactionAccountDtoList) &&
            (identical(other.approvalDto, approvalDto) ||
                other.approvalDto == approvalDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionLineId,
      const DeepCollectionEquality().hash(_transactionAccountDtoList),
      approvalDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderTransactionLinesRequestCopyWith<_$_OrderTransactionLinesRequest>
      get copyWith => __$$_OrderTransactionLinesRequestCopyWithImpl<
          _$_OrderTransactionLinesRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTransactionLinesRequestToJson(
      this,
    );
  }
}

abstract class _OrderTransactionLinesRequest
    implements OrderTransactionLinesRequest {
  const factory _OrderTransactionLinesRequest(
          {@JsonKey(name: 'TransactionLineId')
              required final int transactionLineId,
          @JsonKey(name: 'TransactionAccountDTOList')
              required final List<TransactionLineAccountDto>
                  transactionAccountDtoList,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDto}) =
      _$_OrderTransactionLinesRequest;

  factory _OrderTransactionLinesRequest.fromJson(Map<String, dynamic> json) =
      _$_OrderTransactionLinesRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'TransactionAccountDTOList')
  List<TransactionLineAccountDto> get transactionAccountDtoList;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDto;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTransactionLinesRequestCopyWith<_$_OrderTransactionLinesRequest>
      get copyWith => throw _privateConstructorUsedError;
}
