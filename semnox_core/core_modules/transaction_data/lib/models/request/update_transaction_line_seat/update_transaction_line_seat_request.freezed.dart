// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_transaction_line_seat_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateTransactionLineSeatRequest _$UpdateTransactionLineSeatRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateTransactionLineSeatRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTransactionLineSeatRequest {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeatName')
  String get seatName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SeatNumber')
  String get seatNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTransactionLineSeatRequestCopyWith<UpdateTransactionLineSeatRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTransactionLineSeatRequestCopyWith<$Res> {
  factory $UpdateTransactionLineSeatRequestCopyWith(
          UpdateTransactionLineSeatRequest value,
          $Res Function(UpdateTransactionLineSeatRequest) then) =
      _$UpdateTransactionLineSeatRequestCopyWithImpl<$Res,
          UpdateTransactionLineSeatRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'SeatName') String seatName,
      @JsonKey(name: 'SeatNumber') String seatNumber,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDto});

  $ApprovalDTOCopyWith<$Res> get approvalDto;
}

/// @nodoc
class _$UpdateTransactionLineSeatRequestCopyWithImpl<$Res,
        $Val extends UpdateTransactionLineSeatRequest>
    implements $UpdateTransactionLineSeatRequestCopyWith<$Res> {
  _$UpdateTransactionLineSeatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? seatName = null,
    Object? seatNumber = null,
    Object? lineRemarks = null,
    Object? approvalDto = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_UpdateTransactionLineSeatRequestCopyWith<$Res>
    implements $UpdateTransactionLineSeatRequestCopyWith<$Res> {
  factory _$$_UpdateTransactionLineSeatRequestCopyWith(
          _$_UpdateTransactionLineSeatRequest value,
          $Res Function(_$_UpdateTransactionLineSeatRequest) then) =
      __$$_UpdateTransactionLineSeatRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'SeatName') String seatName,
      @JsonKey(name: 'SeatNumber') String seatNumber,
      @JsonKey(name: 'LineRemarks') String lineRemarks,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDto});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDto;
}

/// @nodoc
class __$$_UpdateTransactionLineSeatRequestCopyWithImpl<$Res>
    extends _$UpdateTransactionLineSeatRequestCopyWithImpl<$Res,
        _$_UpdateTransactionLineSeatRequest>
    implements _$$_UpdateTransactionLineSeatRequestCopyWith<$Res> {
  __$$_UpdateTransactionLineSeatRequestCopyWithImpl(
      _$_UpdateTransactionLineSeatRequest _value,
      $Res Function(_$_UpdateTransactionLineSeatRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? seatName = null,
    Object? seatNumber = null,
    Object? lineRemarks = null,
    Object? approvalDto = null,
  }) {
    return _then(_$_UpdateTransactionLineSeatRequest(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      seatName: null == seatName
          ? _value.seatName
          : seatName // ignore: cast_nullable_to_non_nullable
              as String,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineRemarks: null == lineRemarks
          ? _value.lineRemarks
          : lineRemarks // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDto: null == approvalDto
          ? _value.approvalDto
          : approvalDto // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateTransactionLineSeatRequest
    implements _UpdateTransactionLineSeatRequest {
  const _$_UpdateTransactionLineSeatRequest(
      {@JsonKey(name: 'TransactionLineId') required this.transactionLineId,
      @JsonKey(name: 'SeatName') required this.seatName,
      @JsonKey(name: 'SeatNumber') required this.seatNumber,
      @JsonKey(name: 'LineRemarks') required this.lineRemarks,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDto});

  factory _$_UpdateTransactionLineSeatRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_UpdateTransactionLineSeatRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'SeatName')
  final String seatName;
  @override
  @JsonKey(name: 'SeatNumber')
  final String seatNumber;
  @override
  @JsonKey(name: 'LineRemarks')
  final String lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDto;

  @override
  String toString() {
    return 'UpdateTransactionLineSeatRequest(transactionLineId: $transactionLineId, seatName: $seatName, seatNumber: $seatNumber, lineRemarks: $lineRemarks, approvalDto: $approvalDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTransactionLineSeatRequest &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.seatName, seatName) ||
                other.seatName == seatName) &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.lineRemarks, lineRemarks) ||
                other.lineRemarks == lineRemarks) &&
            (identical(other.approvalDto, approvalDto) ||
                other.approvalDto == approvalDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionLineId, seatName,
      seatNumber, lineRemarks, approvalDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateTransactionLineSeatRequestCopyWith<
          _$_UpdateTransactionLineSeatRequest>
      get copyWith => __$$_UpdateTransactionLineSeatRequestCopyWithImpl<
          _$_UpdateTransactionLineSeatRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTransactionLineSeatRequestToJson(
      this,
    );
  }
}

abstract class _UpdateTransactionLineSeatRequest
    implements UpdateTransactionLineSeatRequest {
  const factory _UpdateTransactionLineSeatRequest(
          {@JsonKey(name: 'TransactionLineId')
              required final int transactionLineId,
          @JsonKey(name: 'SeatName')
              required final String seatName,
          @JsonKey(name: 'SeatNumber')
              required final String seatNumber,
          @JsonKey(name: 'LineRemarks')
              required final String lineRemarks,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDto}) =
      _$_UpdateTransactionLineSeatRequest;

  factory _UpdateTransactionLineSeatRequest.fromJson(
      Map<String, dynamic> json) = _$_UpdateTransactionLineSeatRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'SeatName')
  String get seatName;
  @override
  @JsonKey(name: 'SeatNumber')
  String get seatNumber;
  @override
  @JsonKey(name: 'LineRemarks')
  String get lineRemarks;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDto;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateTransactionLineSeatRequestCopyWith<
          _$_UpdateTransactionLineSeatRequest>
      get copyWith => throw _privateConstructorUsedError;
}
