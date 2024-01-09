// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_remark_line_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionRemarkLineRequest _$TransactionRemarkLineRequestFromJson(
    Map<String, dynamic> json) {
  return _TransactionRemarkLineRequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionRemarkLineRequest {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineRemarks')
  String? get lineRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionRemarkLineRequestCopyWith<TransactionRemarkLineRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRemarkLineRequestCopyWith<$Res> {
  factory $TransactionRemarkLineRequestCopyWith(
          TransactionRemarkLineRequest value,
          $Res Function(TransactionRemarkLineRequest) then) =
      _$TransactionRemarkLineRequestCopyWithImpl<$Res,
          TransactionRemarkLineRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'LineRemarks') String? lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$TransactionRemarkLineRequestCopyWithImpl<$Res,
        $Val extends TransactionRemarkLineRequest>
    implements $TransactionRemarkLineRequestCopyWith<$Res> {
  _$TransactionRemarkLineRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? lineRemarks = freezed,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      lineRemarks: freezed == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_TransactionRemarkLineRequestCopyWith<$Res>
    implements $TransactionRemarkLineRequestCopyWith<$Res> {
  factory _$$_TransactionRemarkLineRequestCopyWith(
          _$_TransactionRemarkLineRequest value,
          $Res Function(_$_TransactionRemarkLineRequest) then) =
      __$$_TransactionRemarkLineRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'LineRemarks') String? lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_TransactionRemarkLineRequestCopyWithImpl<$Res>
    extends _$TransactionRemarkLineRequestCopyWithImpl<$Res,
        _$_TransactionRemarkLineRequest>
    implements _$$_TransactionRemarkLineRequestCopyWith<$Res> {
  __$$_TransactionRemarkLineRequestCopyWithImpl(
      _$_TransactionRemarkLineRequest _value,
      $Res Function(_$_TransactionRemarkLineRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? lineRemarks = freezed,
    Object? approvalDTO = null,
  }) {
    return _then(_$_TransactionRemarkLineRequest(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      lineRemarks: freezed == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionRemarkLineRequest implements _TransactionRemarkLineRequest {
  const _$_TransactionRemarkLineRequest(
      {@JsonKey(name: 'TransactionLineId') required this.transactionLineId,
      @JsonKey(name: 'LineRemarks') this.lineRemarks,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_TransactionRemarkLineRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionRemarkLineRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'LineRemarks')
  final String? lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'TransactionRemarkLineRequest(transactionLineId: $transactionLineId, lineRemarks: $lineRemarks, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionRemarkLineRequest &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.lineRemarks, lineRemarks) ||
                other.lineRemarks == lineRemarks) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transactionLineId, lineRemarks, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionRemarkLineRequestCopyWith<_$_TransactionRemarkLineRequest>
      get copyWith => __$$_TransactionRemarkLineRequestCopyWithImpl<
          _$_TransactionRemarkLineRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionRemarkLineRequestToJson(
      this,
    );
  }
}

abstract class _TransactionRemarkLineRequest
    implements TransactionRemarkLineRequest {
  const factory _TransactionRemarkLineRequest(
          {@JsonKey(name: 'TransactionLineId')
              required final int transactionLineId,
          @JsonKey(name: 'LineRemarks')
              final String? lineRemarks,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDTO}) =
      _$_TransactionRemarkLineRequest;

  factory _TransactionRemarkLineRequest.fromJson(Map<String, dynamic> json) =
      _$_TransactionRemarkLineRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'LineRemarks')
  String? get lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionRemarkLineRequestCopyWith<_$_TransactionRemarkLineRequest>
      get copyWith => throw _privateConstructorUsedError;
}
