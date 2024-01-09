// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompleteSaleRequest _$$_CompleteSaleRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CompleteSaleRequest(
      paymentTransactionDTO: CompleteSaleRequest.fromJson(
          json['PaymentTransactionDTO'] as Map<String, dynamic>),
      otpId: json['OTPId'],
      otp: json['OTP'],
      approvalDTO: json['ApprovalDTO'],
    );

Map<String, dynamic> _$$_CompleteSaleRequestToJson(
        _$_CompleteSaleRequest instance) =>
    <String, dynamic>{
      'PaymentTransactionDTO': instance.paymentTransactionDTO,
      'OTPId': instance.otpId,
      'OTP': instance.otp,
      'ApprovalDTO': instance.approvalDTO,
    };
