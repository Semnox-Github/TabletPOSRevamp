import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:payment_data/models/coupon_details/coupon_details_response.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

part 'voucher_screen_state.freezed.dart';
part 'voucher_screen_state.g.dart';

@freezed
class VoucherScreenState with _$VoucherScreenState {
  const factory VoucherScreenState({
    @Default(false) bool isLoading,
    TransactionResponse? transactionResponse,
    CouponDetailsResponse? couponDetails,
    @Default(false) bool isTaxableSelected,
    String? loadingMessage,
    String? validationError,
    String? apiError,
    String? notificationMessage,
  }) = _VoucherScreenState;

  factory VoucherScreenState.fromJson(Map<String, dynamic> json) => _$VoucherScreenStateFromJson(json);
}