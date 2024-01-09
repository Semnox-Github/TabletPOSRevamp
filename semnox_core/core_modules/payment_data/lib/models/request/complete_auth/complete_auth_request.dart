// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment_data/models/request/complete_sale/complete_sale_request.dart';

part 'complete_auth_request.freezed.dart';
part 'complete_auth_request.g.dart';

@freezed
class CompleteAuthRequest with _$CompleteAuthRequest {
  const factory CompleteAuthRequest({
    @JsonKey(name: 'PaymentTransactionDTO')
    required CompleteSaleRequest paymentTransactionDTO,
    @JsonKey(name: 'OTPId')
    dynamic otpId,
    @JsonKey(name: 'OTP')
    dynamic otp,
    @JsonKey(name: 'ApprovalDTO')
    dynamic approvalDTO,
  }) = _CompleteSaleRequest;

  factory CompleteAuthRequest.fromJson(Map<String, dynamic> json) => _$CompleteAuthRequestFromJson(json);
}