// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'close_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CloseTransactionRequest _$CloseTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return _CloseTransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$CloseTransactionRequest {
  @JsonKey(name: 'TransactionId')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloseTransactionRequestCopyWith<CloseTransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloseTransactionRequestCopyWith<$Res> {
  factory $CloseTransactionRequestCopyWith(CloseTransactionRequest value,
          $Res Function(CloseTransactionRequest) then) =
      _$CloseTransactionRequestCopyWithImpl<$Res, CloseTransactionRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'Reason') String reason,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$CloseTransactionRequestCopyWithImpl<$Res,
        $Val extends CloseTransactionRequest>
    implements $CloseTransactionRequestCopyWith<$Res> {
  _$CloseTransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? reason = null,
    Object? remarks = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovalDTOCopyWith<$Res> get approvalDTO {
    return $ApprovalDTOCopyWith<$Res>(_value.approvalDTO, (value) {
      return _then(_value.copyWith(approvalDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CloseTransactionRequestCopyWith<$Res>
    implements $CloseTransactionRequestCopyWith<$Res> {
  factory _$$_CloseTransactionRequestCopyWith(_$_CloseTransactionRequest value,
          $Res Function(_$_CloseTransactionRequest) then) =
      __$$_CloseTransactionRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'Reason') String reason,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_CloseTransactionRequestCopyWithImpl<$Res>
    extends _$CloseTransactionRequestCopyWithImpl<$Res,
        _$_CloseTransactionRequest>
    implements _$$_CloseTransactionRequestCopyWith<$Res> {
  __$$_CloseTransactionRequestCopyWithImpl(_$_CloseTransactionRequest _value,
      $Res Function(_$_CloseTransactionRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? reason = null,
    Object? remarks = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_CloseTransactionRequest(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CloseTransactionRequest implements _CloseTransactionRequest {
  const _$_CloseTransactionRequest(
      {@JsonKey(name: 'TransactionId') required this.transactionId,
      @JsonKey(name: 'Reason') required this.reason,
      @JsonKey(name: 'Remarks') required this.remarks,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_CloseTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CloseTransactionRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionId')
  final int transactionId;
  @override
  @JsonKey(name: 'Reason')
  final String reason;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'CloseTransactionRequest(transactionId: $transactionId, reason: $reason, remarks: $remarks, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CloseTransactionRequest &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transactionId, reason, remarks, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CloseTransactionRequestCopyWith<_$_CloseTransactionRequest>
      get copyWith =>
          __$$_CloseTransactionRequestCopyWithImpl<_$_CloseTransactionRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CloseTransactionRequestToJson(
      this,
    );
  }
}

abstract class _CloseTransactionRequest implements CloseTransactionRequest {
  const factory _CloseTransactionRequest(
      {@JsonKey(name: 'TransactionId')
          required final int transactionId,
      @JsonKey(name: 'Reason')
          required final String reason,
      @JsonKey(name: 'Remarks')
          required final String remarks,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_CloseTransactionRequest;

  factory _CloseTransactionRequest.fromJson(Map<String, dynamic> json) =
      _$_CloseTransactionRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionId')
  int get transactionId;
  @override
  @JsonKey(name: 'Reason')
  String get reason;
  @override
  @JsonKey(name: 'Remarks')
  String get remarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_CloseTransactionRequestCopyWith<_$_CloseTransactionRequest>
      get copyWith => throw _privateConstructorUsedError;
}
