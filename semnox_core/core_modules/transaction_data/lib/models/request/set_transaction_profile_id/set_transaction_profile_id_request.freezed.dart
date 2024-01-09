// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_transaction_profile_id_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetTransactionProfileIdRequest _$SetTransactionProfileIdRequestFromJson(
    Map<String, dynamic> json) {
  return _SetTransactionProfileIdRequest.fromJson(json);
}

/// @nodoc
mixin _$SetTransactionProfileIdRequest {
  @JsonKey(name: 'TransactionProfileId')
  int get transactionProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetTransactionProfileIdRequestCopyWith<SetTransactionProfileIdRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetTransactionProfileIdRequestCopyWith<$Res> {
  factory $SetTransactionProfileIdRequestCopyWith(
          SetTransactionProfileIdRequest value,
          $Res Function(SetTransactionProfileIdRequest) then) =
      _$SetTransactionProfileIdRequestCopyWithImpl<$Res,
          SetTransactionProfileIdRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionProfileId') int transactionProfileId,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$SetTransactionProfileIdRequestCopyWithImpl<$Res,
        $Val extends SetTransactionProfileIdRequest>
    implements $SetTransactionProfileIdRequestCopyWith<$Res> {
  _$SetTransactionProfileIdRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionProfileId = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionProfileId: null == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_SetTransactionProfileIdRequestCopyWith<$Res>
    implements $SetTransactionProfileIdRequestCopyWith<$Res> {
  factory _$$_SetTransactionProfileIdRequestCopyWith(
          _$_SetTransactionProfileIdRequest value,
          $Res Function(_$_SetTransactionProfileIdRequest) then) =
      __$$_SetTransactionProfileIdRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionProfileId') int transactionProfileId,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_SetTransactionProfileIdRequestCopyWithImpl<$Res>
    extends _$SetTransactionProfileIdRequestCopyWithImpl<$Res,
        _$_SetTransactionProfileIdRequest>
    implements _$$_SetTransactionProfileIdRequestCopyWith<$Res> {
  __$$_SetTransactionProfileIdRequestCopyWithImpl(
      _$_SetTransactionProfileIdRequest _value,
      $Res Function(_$_SetTransactionProfileIdRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionProfileId = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_SetTransactionProfileIdRequest(
      transactionProfileId: null == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetTransactionProfileIdRequest
    implements _SetTransactionProfileIdRequest {
  const _$_SetTransactionProfileIdRequest(
      {@JsonKey(name: 'TransactionProfileId')
          required this.transactionProfileId,
      @JsonKey(name: 'ApprovalDTO')
          required this.approvalDTO});

  factory _$_SetTransactionProfileIdRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_SetTransactionProfileIdRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionProfileId')
  final int transactionProfileId;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'SetTransactionProfileIdRequest(transactionProfileId: $transactionProfileId, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTransactionProfileIdRequest &&
            (identical(other.transactionProfileId, transactionProfileId) ||
                other.transactionProfileId == transactionProfileId) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transactionProfileId, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetTransactionProfileIdRequestCopyWith<_$_SetTransactionProfileIdRequest>
      get copyWith => __$$_SetTransactionProfileIdRequestCopyWithImpl<
          _$_SetTransactionProfileIdRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetTransactionProfileIdRequestToJson(
      this,
    );
  }
}

abstract class _SetTransactionProfileIdRequest
    implements SetTransactionProfileIdRequest {
  const factory _SetTransactionProfileIdRequest(
          {@JsonKey(name: 'TransactionProfileId')
              required final int transactionProfileId,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDTO}) =
      _$_SetTransactionProfileIdRequest;

  factory _SetTransactionProfileIdRequest.fromJson(Map<String, dynamic> json) =
      _$_SetTransactionProfileIdRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionProfileId')
  int get transactionProfileId;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_SetTransactionProfileIdRequestCopyWith<_$_SetTransactionProfileIdRequest>
      get copyWith => throw _privateConstructorUsedError;
}
