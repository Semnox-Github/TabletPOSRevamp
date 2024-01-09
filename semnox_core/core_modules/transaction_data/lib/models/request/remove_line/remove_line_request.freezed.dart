// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_line_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoveLineRequest _$RemoveLineRequestFromJson(Map<String, dynamic> json) {
  return _RemoveLineRequest.fromJson(json);
}

/// @nodoc
mixin _$RemoveLineRequest {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonId')
  int get reasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoveLineRequestCopyWith<RemoveLineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveLineRequestCopyWith<$Res> {
  factory $RemoveLineRequestCopyWith(
          RemoveLineRequest value, $Res Function(RemoveLineRequest) then) =
      _$RemoveLineRequestCopyWithImpl<$Res, RemoveLineRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'ReasonId') int reasonId,
      @JsonKey(name: 'Reason') String reason,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$RemoveLineRequestCopyWithImpl<$Res, $Val extends RemoveLineRequest>
    implements $RemoveLineRequestCopyWith<$Res> {
  _$RemoveLineRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? reasonId = null,
    Object? reason = null,
    Object? lineRemarks = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      reasonId: null == reasonId
          ? _value.reasonId
          : reasonId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_RemoveLineRequestCopyWith<$Res>
    implements $RemoveLineRequestCopyWith<$Res> {
  factory _$$_RemoveLineRequestCopyWith(_$_RemoveLineRequest value,
          $Res Function(_$_RemoveLineRequest) then) =
      __$$_RemoveLineRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'ReasonId') int reasonId,
      @JsonKey(name: 'Reason') String reason,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_RemoveLineRequestCopyWithImpl<$Res>
    extends _$RemoveLineRequestCopyWithImpl<$Res, _$_RemoveLineRequest>
    implements _$$_RemoveLineRequestCopyWith<$Res> {
  __$$_RemoveLineRequestCopyWithImpl(
      _$_RemoveLineRequest _value, $Res Function(_$_RemoveLineRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? reasonId = null,
    Object? reason = null,
    Object? lineRemarks = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_RemoveLineRequest(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      reasonId: null == reasonId
          ? _value.reasonId
          : reasonId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
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
class _$_RemoveLineRequest implements _RemoveLineRequest {
  const _$_RemoveLineRequest(
      {@JsonKey(name: 'TransactionLineId') required this.transactionLineId,
      @JsonKey(name: 'ReasonId') required this.reasonId,
      @JsonKey(name: 'Reason') required this.reason,
      @JsonKey(name: 'LineRemarks') required this.lineRemarks,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_RemoveLineRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RemoveLineRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'ReasonId')
  final int reasonId;
  @override
  @JsonKey(name: 'Reason')
  final String reason;
  @override
  @JsonKey(name: 'LineRemarks')
  final String lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'RemoveLineRequest(transactionLineId: $transactionLineId, reasonId: $reasonId, reason: $reason, lineRemarks: $lineRemarks, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveLineRequest &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.reasonId, reasonId) ||
                other.reasonId == reasonId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.lineRemarks, lineRemarks) ||
                other.lineRemarks == lineRemarks) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionLineId, reasonId,
      reason, lineRemarks, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveLineRequestCopyWith<_$_RemoveLineRequest> get copyWith =>
      __$$_RemoveLineRequestCopyWithImpl<_$_RemoveLineRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoveLineRequestToJson(
      this,
    );
  }
}

abstract class _RemoveLineRequest implements RemoveLineRequest {
  const factory _RemoveLineRequest(
      {@JsonKey(name: 'TransactionLineId')
          required final int transactionLineId,
      @JsonKey(name: 'ReasonId')
          required final int reasonId,
      @JsonKey(name: 'Reason')
          required final String reason,
      @JsonKey(name: 'LineRemarks')
          required final String lineRemarks,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_RemoveLineRequest;

  factory _RemoveLineRequest.fromJson(Map<String, dynamic> json) =
      _$_RemoveLineRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'ReasonId')
  int get reasonId;
  @override
  @JsonKey(name: 'Reason')
  String get reason;
  @override
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_RemoveLineRequestCopyWith<_$_RemoveLineRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
