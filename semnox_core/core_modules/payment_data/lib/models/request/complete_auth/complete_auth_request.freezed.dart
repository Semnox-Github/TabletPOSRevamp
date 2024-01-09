// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_auth_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompleteAuthRequest _$CompleteAuthRequestFromJson(Map<String, dynamic> json) {
  return _CompleteSaleRequest.fromJson(json);
}

/// @nodoc
mixin _$CompleteAuthRequest {
  @JsonKey(name: 'PaymentTransactionDTO')
  CompleteSaleRequest get paymentTransactionDTO =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'OTPId')
  dynamic get otpId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OTP')
  dynamic get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  dynamic get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompleteAuthRequestCopyWith<CompleteAuthRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteAuthRequestCopyWith<$Res> {
  factory $CompleteAuthRequestCopyWith(
          CompleteAuthRequest value, $Res Function(CompleteAuthRequest) then) =
      _$CompleteAuthRequestCopyWithImpl<$Res, CompleteAuthRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentTransactionDTO')
          CompleteSaleRequest paymentTransactionDTO,
      @JsonKey(name: 'OTPId')
          dynamic otpId,
      @JsonKey(name: 'OTP')
          dynamic otp,
      @JsonKey(name: 'ApprovalDTO')
          dynamic approvalDTO});

  $CompleteSaleRequestCopyWith<$Res> get paymentTransactionDTO;
}

/// @nodoc
class _$CompleteAuthRequestCopyWithImpl<$Res, $Val extends CompleteAuthRequest>
    implements $CompleteAuthRequestCopyWith<$Res> {
  _$CompleteAuthRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTransactionDTO = null,
    Object? otpId = freezed,
    Object? otp = freezed,
    Object? approvalDTO = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTransactionDTO: null == paymentTransactionDTO
          ? _value.paymentTransactionDTO
          : paymentTransactionDTO // ignore: cast_nullable_to_non_nullable
              as CompleteSaleRequest,
      otpId: freezed == otpId
          ? _value.otpId
          : otpId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      approvalDTO: freezed == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompleteSaleRequestCopyWith<$Res> get paymentTransactionDTO {
    return $CompleteSaleRequestCopyWith<$Res>(_value.paymentTransactionDTO,
        (value) {
      return _then(_value.copyWith(paymentTransactionDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CompleteSaleRequestCopyWith<$Res>
    implements $CompleteAuthRequestCopyWith<$Res> {
  factory _$$_CompleteSaleRequestCopyWith(_$_CompleteSaleRequest value,
          $Res Function(_$_CompleteSaleRequest) then) =
      __$$_CompleteSaleRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentTransactionDTO')
          CompleteSaleRequest paymentTransactionDTO,
      @JsonKey(name: 'OTPId')
          dynamic otpId,
      @JsonKey(name: 'OTP')
          dynamic otp,
      @JsonKey(name: 'ApprovalDTO')
          dynamic approvalDTO});

  @override
  $CompleteSaleRequestCopyWith<$Res> get paymentTransactionDTO;
}

/// @nodoc
class __$$_CompleteSaleRequestCopyWithImpl<$Res>
    extends _$CompleteAuthRequestCopyWithImpl<$Res, _$_CompleteSaleRequest>
    implements _$$_CompleteSaleRequestCopyWith<$Res> {
  __$$_CompleteSaleRequestCopyWithImpl(_$_CompleteSaleRequest _value,
      $Res Function(_$_CompleteSaleRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTransactionDTO = null,
    Object? otpId = freezed,
    Object? otp = freezed,
    Object? approvalDTO = freezed,
  }) {
    return _then(_$_CompleteSaleRequest(
      paymentTransactionDTO: null == paymentTransactionDTO
          ? _value.paymentTransactionDTO
          : paymentTransactionDTO // ignore: cast_nullable_to_non_nullable
              as CompleteSaleRequest,
      otpId: freezed == otpId
          ? _value.otpId
          : otpId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      approvalDTO: freezed == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompleteSaleRequest implements _CompleteSaleRequest {
  const _$_CompleteSaleRequest(
      {@JsonKey(name: 'PaymentTransactionDTO')
          required this.paymentTransactionDTO,
      @JsonKey(name: 'OTPId')
          this.otpId,
      @JsonKey(name: 'OTP')
          this.otp,
      @JsonKey(name: 'ApprovalDTO')
          this.approvalDTO});

  factory _$_CompleteSaleRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CompleteSaleRequestFromJson(json);

  @override
  @JsonKey(name: 'PaymentTransactionDTO')
  final CompleteSaleRequest paymentTransactionDTO;
  @override
  @JsonKey(name: 'OTPId')
  final dynamic otpId;
  @override
  @JsonKey(name: 'OTP')
  final dynamic otp;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final dynamic approvalDTO;

  @override
  String toString() {
    return 'CompleteAuthRequest(paymentTransactionDTO: $paymentTransactionDTO, otpId: $otpId, otp: $otp, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompleteSaleRequest &&
            (identical(other.paymentTransactionDTO, paymentTransactionDTO) ||
                other.paymentTransactionDTO == paymentTransactionDTO) &&
            const DeepCollectionEquality().equals(other.otpId, otpId) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            const DeepCollectionEquality()
                .equals(other.approvalDTO, approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentTransactionDTO,
      const DeepCollectionEquality().hash(otpId),
      const DeepCollectionEquality().hash(otp),
      const DeepCollectionEquality().hash(approvalDTO));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompleteSaleRequestCopyWith<_$_CompleteSaleRequest> get copyWith =>
      __$$_CompleteSaleRequestCopyWithImpl<_$_CompleteSaleRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompleteSaleRequestToJson(
      this,
    );
  }
}

abstract class _CompleteSaleRequest implements CompleteAuthRequest {
  const factory _CompleteSaleRequest(
      {@JsonKey(name: 'PaymentTransactionDTO')
          required final CompleteSaleRequest paymentTransactionDTO,
      @JsonKey(name: 'OTPId')
          final dynamic otpId,
      @JsonKey(name: 'OTP')
          final dynamic otp,
      @JsonKey(name: 'ApprovalDTO')
          final dynamic approvalDTO}) = _$_CompleteSaleRequest;

  factory _CompleteSaleRequest.fromJson(Map<String, dynamic> json) =
      _$_CompleteSaleRequest.fromJson;

  @override
  @JsonKey(name: 'PaymentTransactionDTO')
  CompleteSaleRequest get paymentTransactionDTO;
  @override
  @JsonKey(name: 'OTPId')
  dynamic get otpId;
  @override
  @JsonKey(name: 'OTP')
  dynamic get otp;
  @override
  @JsonKey(name: 'ApprovalDTO')
  dynamic get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_CompleteSaleRequestCopyWith<_$_CompleteSaleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
