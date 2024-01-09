// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return _TransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionRequest {
  @JsonKey(name: 'GuestCount')
  int? get guestCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionProfileId')
  int get transactionProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrimaryAccountNumber')
  String? get primaryAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'GuestName')
  String? get guestName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionIdentifier')
  String? get transactionIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'GuestContact')
  String? get guestContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'TentNumber')
  String? get tentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionDateTime')
  String? get transactionDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionRequestCopyWith<TransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRequestCopyWith<$Res> {
  factory $TransactionRequestCopyWith(
          TransactionRequest value, $Res Function(TransactionRequest) then) =
      _$TransactionRequestCopyWithImpl<$Res, TransactionRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'GuestCount') int? guestCount,
      @JsonKey(name: 'TransactionProfileId') int transactionProfileId,
      @JsonKey(name: 'PrimaryAccountNumber') String? primaryAccountNumber,
      @JsonKey(name: 'GuestName') String? guestName,
      @JsonKey(name: 'TransactionIdentifier') String? transactionIdentifier,
      @JsonKey(name: 'GuestContact') String? guestContact,
      @JsonKey(name: 'TentNumber') String? tentNumber,
      @JsonKey(name: 'Remarks') String? remarks,
      @JsonKey(name: 'TransactionDateTime') String? transactionDateTime,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$TransactionRequestCopyWithImpl<$Res, $Val extends TransactionRequest>
    implements $TransactionRequestCopyWith<$Res> {
  _$TransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestCount = freezed,
    Object? transactionProfileId = null,
    Object? primaryAccountNumber = freezed,
    Object? guestName = freezed,
    Object? transactionIdentifier = freezed,
    Object? guestContact = freezed,
    Object? tentNumber = freezed,
    Object? remarks = freezed,
    Object? transactionDateTime = freezed,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      guestCount: freezed == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionProfileId: null == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      primaryAccountNumber: freezed == primaryAccountNumber
          ? _value.primaryAccountNumber
          : primaryAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionIdentifier: freezed == transactionIdentifier
          ? _value.transactionIdentifier
          : transactionIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      guestContact: freezed == guestContact
          ? _value.guestContact
          : guestContact // ignore: cast_nullable_to_non_nullable
              as String?,
      tentNumber: freezed == tentNumber
          ? _value.tentNumber
          : tentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDateTime: freezed == transactionDateTime
          ? _value.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TransactionRequestCopyWith<$Res>
    implements $TransactionRequestCopyWith<$Res> {
  factory _$$_TransactionRequestCopyWith(_$_TransactionRequest value,
          $Res Function(_$_TransactionRequest) then) =
      __$$_TransactionRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'GuestCount') int? guestCount,
      @JsonKey(name: 'TransactionProfileId') int transactionProfileId,
      @JsonKey(name: 'PrimaryAccountNumber') String? primaryAccountNumber,
      @JsonKey(name: 'GuestName') String? guestName,
      @JsonKey(name: 'TransactionIdentifier') String? transactionIdentifier,
      @JsonKey(name: 'GuestContact') String? guestContact,
      @JsonKey(name: 'TentNumber') String? tentNumber,
      @JsonKey(name: 'Remarks') String? remarks,
      @JsonKey(name: 'TransactionDateTime') String? transactionDateTime,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_TransactionRequestCopyWithImpl<$Res>
    extends _$TransactionRequestCopyWithImpl<$Res, _$_TransactionRequest>
    implements _$$_TransactionRequestCopyWith<$Res> {
  __$$_TransactionRequestCopyWithImpl(
      _$_TransactionRequest _value, $Res Function(_$_TransactionRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestCount = freezed,
    Object? transactionProfileId = null,
    Object? primaryAccountNumber = freezed,
    Object? guestName = freezed,
    Object? transactionIdentifier = freezed,
    Object? guestContact = freezed,
    Object? tentNumber = freezed,
    Object? remarks = freezed,
    Object? transactionDateTime = freezed,
    Object? approvalDTO = null,
  }) {
    return _then(_$_TransactionRequest(
      guestCount: freezed == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionProfileId: null == transactionProfileId
          ? _value.transactionProfileId
          : transactionProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      primaryAccountNumber: freezed == primaryAccountNumber
          ? _value.primaryAccountNumber
          : primaryAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionIdentifier: freezed == transactionIdentifier
          ? _value.transactionIdentifier
          : transactionIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      guestContact: freezed == guestContact
          ? _value.guestContact
          : guestContact // ignore: cast_nullable_to_non_nullable
              as String?,
      tentNumber: freezed == tentNumber
          ? _value.tentNumber
          : tentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDateTime: freezed == transactionDateTime
          ? _value.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
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
class _$_TransactionRequest implements _TransactionRequest {
  const _$_TransactionRequest(
      {@JsonKey(name: 'GuestCount') this.guestCount,
      @JsonKey(name: 'TransactionProfileId') required this.transactionProfileId,
      @JsonKey(name: 'PrimaryAccountNumber') this.primaryAccountNumber,
      @JsonKey(name: 'GuestName') this.guestName,
      @JsonKey(name: 'TransactionIdentifier') this.transactionIdentifier,
      @JsonKey(name: 'GuestContact') this.guestContact,
      @JsonKey(name: 'TentNumber') this.tentNumber,
      @JsonKey(name: 'Remarks') this.remarks,
      @JsonKey(name: 'TransactionDateTime') this.transactionDateTime,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionRequestFromJson(json);

  @override
  @JsonKey(name: 'GuestCount')
  final int? guestCount;
  @override
  @JsonKey(name: 'TransactionProfileId')
  final int transactionProfileId;
  @override
  @JsonKey(name: 'PrimaryAccountNumber')
  final String? primaryAccountNumber;
  @override
  @JsonKey(name: 'GuestName')
  final String? guestName;
  @override
  @JsonKey(name: 'TransactionIdentifier')
  final String? transactionIdentifier;
  @override
  @JsonKey(name: 'GuestContact')
  final String? guestContact;
  @override
  @JsonKey(name: 'TentNumber')
  final String? tentNumber;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'TransactionDateTime')
  final String? transactionDateTime;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'TransactionRequest(guestCount: $guestCount, transactionProfileId: $transactionProfileId, primaryAccountNumber: $primaryAccountNumber, guestName: $guestName, transactionIdentifier: $transactionIdentifier, guestContact: $guestContact, tentNumber: $tentNumber, remarks: $remarks, transactionDateTime: $transactionDateTime, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionRequest &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.transactionProfileId, transactionProfileId) ||
                other.transactionProfileId == transactionProfileId) &&
            (identical(other.primaryAccountNumber, primaryAccountNumber) ||
                other.primaryAccountNumber == primaryAccountNumber) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.transactionIdentifier, transactionIdentifier) ||
                other.transactionIdentifier == transactionIdentifier) &&
            (identical(other.guestContact, guestContact) ||
                other.guestContact == guestContact) &&
            (identical(other.tentNumber, tentNumber) ||
                other.tentNumber == tentNumber) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.transactionDateTime, transactionDateTime) ||
                other.transactionDateTime == transactionDateTime) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      guestCount,
      transactionProfileId,
      primaryAccountNumber,
      guestName,
      transactionIdentifier,
      guestContact,
      tentNumber,
      remarks,
      transactionDateTime,
      approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionRequestCopyWith<_$_TransactionRequest> get copyWith =>
      __$$_TransactionRequestCopyWithImpl<_$_TransactionRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionRequestToJson(
      this,
    );
  }
}

abstract class _TransactionRequest implements TransactionRequest {
  const factory _TransactionRequest(
      {@JsonKey(name: 'GuestCount')
          final int? guestCount,
      @JsonKey(name: 'TransactionProfileId')
          required final int transactionProfileId,
      @JsonKey(name: 'PrimaryAccountNumber')
          final String? primaryAccountNumber,
      @JsonKey(name: 'GuestName')
          final String? guestName,
      @JsonKey(name: 'TransactionIdentifier')
          final String? transactionIdentifier,
      @JsonKey(name: 'GuestContact')
          final String? guestContact,
      @JsonKey(name: 'TentNumber')
          final String? tentNumber,
      @JsonKey(name: 'Remarks')
          final String? remarks,
      @JsonKey(name: 'TransactionDateTime')
          final String? transactionDateTime,
      @JsonKey(name: 'ApprovalDTO')
          required final ApprovalDTO approvalDTO}) = _$_TransactionRequest;

  factory _TransactionRequest.fromJson(Map<String, dynamic> json) =
      _$_TransactionRequest.fromJson;

  @override
  @JsonKey(name: 'GuestCount')
  int? get guestCount;
  @override
  @JsonKey(name: 'TransactionProfileId')
  int get transactionProfileId;
  @override
  @JsonKey(name: 'PrimaryAccountNumber')
  String? get primaryAccountNumber;
  @override
  @JsonKey(name: 'GuestName')
  String? get guestName;
  @override
  @JsonKey(name: 'TransactionIdentifier')
  String? get transactionIdentifier;
  @override
  @JsonKey(name: 'GuestContact')
  String? get guestContact;
  @override
  @JsonKey(name: 'TentNumber')
  String? get tentNumber;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'TransactionDateTime')
  String? get transactionDateTime;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionRequestCopyWith<_$_TransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
