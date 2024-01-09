// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_summary_dto.freezed.dart';
part 'account_summary_dto.g.dart';

@freezed
class AccountSummaryDTO with _$AccountSummaryDTO {
  const factory AccountSummaryDTO({
    @JsonKey(name: 'CreditPlusCardBalance')
    required double creditPlusCardBalance,
    @JsonKey(name: 'CreditPlusGamePlayCredits')
    required double creditPlusGamePlayCredits,
    @JsonKey(name: 'CreditPlusItemPurchase')
    required double creditPlusItemPurchase,
    @JsonKey(name: 'CreditPlusBonus')
    required double creditPlusBonus,
    @JsonKey(name: 'CreditPlusLoyaltyPoints')
    required double creditPlusLoyaltyPoints,
    @JsonKey(name: 'CreditPlusTickets')
    required double creditPlusTickets,
    @JsonKey(name: 'CreditPlusVirtualPoints')
    required double creditPlusVirtualPoints,
    @JsonKey(name: 'CreditPlusTime')
    required double creditPlusTime,
    @JsonKey(name: 'CreditPlusRefundableBalance')
    required double creditPlusRefundableBalance,
    @JsonKey(name: 'RedeemableCreditPlusLoyaltyPoints')
    required double redeemableCreditPlusLoyaltyPoints,
    @JsonKey(name: 'AccountGameBalance')
    required int accountGameBalance,
    @JsonKey(name: 'TotalGamePlayCreditsBalance')
    required double totalGamePlayCreditsBalance,
    @JsonKey(name: 'TotalBonusBalance')
    required double totalBonusBalance,
    @JsonKey(name: 'TotalCourtesyBalance')
    required double totalCourtesyBalance,
    @JsonKey(name: 'TotalTimeBalance')
    required double totalTimeBalance,
    @JsonKey(name: 'TotalVirtualPointBalance')
    required double totalVirtualPointBalance,
    @JsonKey(name: 'TotalGamesBalance')
    required double totalGamesBalance,
    @JsonKey(name: 'TotalTicketsBalance')
    required double totalTicketsBalance,
    @JsonKey(name: 'TotalLoyaltyPointBalance')
    required double totalLoyaltyPointBalance,
    @JsonKey(name: 'AccountExpiryDate')
    dynamic accountExpiryDate,
    @JsonKey(name: 'ExpiringCPTotalCredits')
    required double expiringCpTotalCredits,
    @JsonKey(name: 'ExpiringCPBonus')
    required double expiringCpBonus,
    @JsonKey(name: 'ExpiringCPLoyalty')
    required double expiringCpLoyalty,
    @JsonKey(name: 'ExpiringCPTickets')
    required double expiringCpTickets,
    @JsonKey(name: 'ExpiringCPCardBalance')
    required double expiringCpCardBalance,
    @JsonKey(name: 'ExpiringCPGamePlayCredits')
    required double expiringCpGamePlayCredits,
    @JsonKey(name: 'ExpiringCPCounterItem')
    required double expiringCpCounterItem,
    @JsonKey(name: 'CPTotalCreditsExpiryDate')
    dynamic cpTotalCreditsExpiryDate,
    @JsonKey(name: 'CPBonusExpiryDate')
    dynamic cpBonusExpiryDate,
    @JsonKey(name: 'CPLoyaltyExpiryDate')
    dynamic cpLoyaltyExpiryDate,
    @JsonKey(name: 'CPTicketsExpiryDate')
    dynamic cpTicketsExpiryDate,
    @JsonKey(name: 'CPCardBalanceExpiryDate')
    dynamic cpCardBalanceExpiryDate,
    @JsonKey(name: 'CPGamePlayCreditsExpiryDate')
    dynamic cpGamePlayCreditsExpiryDate,
    @JsonKey(name: 'CPCounterItemExpiryDate')
    dynamic cpCounterItemExpiryDate,
    @JsonKey(name: 'FormattedCreditPlusCardBalance')
    required String formattedCreditPlusCardBalance,
    @JsonKey(name: 'FormattedCreditPlusVirtualPointBalance')
    required String formattedCreditPlusVirtualPointBalance,
    @JsonKey(name: 'FormattedCreditPlusGamePlayCredits')
    required String formattedCreditPlusGamePlayCredits,
    @JsonKey(name: 'FormattedCreditPlusItemPurchase')
    required String formattedCreditPlusItemPurchase,
    @JsonKey(name: 'FormattedCreditPlusBonus')
    required String formattedCreditPlusBonus,
    @JsonKey(name: 'FormattedCreditPlusLoyaltyPoints')
    required String formattedCreditPlusLoyaltyPoints,
    @JsonKey(name: 'FormattedCreditPlusTickets')
    required String formattedCreditPlusTickets,
    @JsonKey(name: 'FormattedCreditPlusTime')
    required String formattedCreditPlusTime,
    @JsonKey(name: 'FormattedCreditPlusRefundableBalance')
    required String formattedCreditPlusRefundableBalance,
    @JsonKey(name: 'FormattedRedeemableCreditPlusLoyaltyPoints')
    required String formattedRedeemableCreditPlusLoyaltyPoints,
    @JsonKey(name: 'FormattedTotalGamePlayCreditsBalance')
    required String formattedTotalGamePlayCreditsBalance,
    @JsonKey(name: 'FormattedTotalBonusBalance')
    required String formattedTotalBonusBalance,
    @JsonKey(name: 'FormattedTotalCourtesyBalance')
    required String formattedTotalCourtesyBalance,
    @JsonKey(name: 'FormattedTotalTimeBalance')
    required String formattedTotalTimeBalance,
    @JsonKey(name: 'FormattedTotalGamesBalance')
    required String formattedTotalGamesBalance,
    @JsonKey(name: 'FormattedTotalTicketsBalance')
    required String formattedTotalTicketsBalance,
    @JsonKey(name: 'FormattedTotalLoyaltyPointBalance')
    required String formattedTotalLoyaltyPointBalance,
    @JsonKey(name: 'FormattedAccountExpiryDate')
    required String formattedAccountExpiryDate,
  }) = _AccountSummaryDTO;

  factory AccountSummaryDTO.fromJson(Map<String, dynamic> json) => _$AccountSummaryDTOFromJson(json);
}