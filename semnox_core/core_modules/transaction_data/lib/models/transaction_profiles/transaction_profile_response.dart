import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_data.dart';

part 'transaction_profile_response.freezed.dart';
part 'transaction_profile_response.g.dart';

@freezed
class TransactionProfileResponse with _$TransactionProfileResponse {
  const factory TransactionProfileResponse({
    TransactionProfileData? data,
    String? exception
  }) = _TransactionProfileResponse;

  factory TransactionProfileResponse.fromJson(Map<String, dynamic> json) => _$TransactionProfileResponseFromJson(json);
}