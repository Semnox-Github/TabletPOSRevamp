// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountSummaryDTO _$$_AccountSummaryDTOFromJson(Map<String, dynamic> json) =>
    _$_AccountSummaryDTO(
      creditPlusCardBalance: (json['CreditPlusCardBalance'] as num).toDouble(),
      creditPlusGamePlayCredits:
          (json['CreditPlusGamePlayCredits'] as num).toDouble(),
      creditPlusItemPurchase:
          (json['CreditPlusItemPurchase'] as num).toDouble(),
      creditPlusBonus: (json['CreditPlusBonus'] as num).toDouble(),
      creditPlusLoyaltyPoints:
          (json['CreditPlusLoyaltyPoints'] as num).toDouble(),
      creditPlusTickets: (json['CreditPlusTickets'] as num).toDouble(),
      creditPlusVirtualPoints:
          (json['CreditPlusVirtualPoints'] as num).toDouble(),
      creditPlusTime: (json['CreditPlusTime'] as num).toDouble(),
      creditPlusRefundableBalance:
          (json['CreditPlusRefundableBalance'] as num).toDouble(),
      redeemableCreditPlusLoyaltyPoints:
          (json['RedeemableCreditPlusLoyaltyPoints'] as num).toDouble(),
      accountGameBalance: json['AccountGameBalance'] as int,
      totalGamePlayCreditsBalance:
          (json['TotalGamePlayCreditsBalance'] as num).toDouble(),
      totalBonusBalance: (json['TotalBonusBalance'] as num).toDouble(),
      totalCourtesyBalance: (json['TotalCourtesyBalance'] as num).toDouble(),
      totalTimeBalance: (json['TotalTimeBalance'] as num).toDouble(),
      totalVirtualPointBalance:
          (json['TotalVirtualPointBalance'] as num).toDouble(),
      totalGamesBalance: (json['TotalGamesBalance'] as num).toDouble(),
      totalTicketsBalance: (json['TotalTicketsBalance'] as num).toDouble(),
      totalLoyaltyPointBalance:
          (json['TotalLoyaltyPointBalance'] as num).toDouble(),
      accountExpiryDate: json['AccountExpiryDate'],
      expiringCpTotalCredits:
          (json['ExpiringCPTotalCredits'] as num).toDouble(),
      expiringCpBonus: (json['ExpiringCPBonus'] as num).toDouble(),
      expiringCpLoyalty: (json['ExpiringCPLoyalty'] as num).toDouble(),
      expiringCpTickets: (json['ExpiringCPTickets'] as num).toDouble(),
      expiringCpCardBalance: (json['ExpiringCPCardBalance'] as num).toDouble(),
      expiringCpGamePlayCredits:
          (json['ExpiringCPGamePlayCredits'] as num).toDouble(),
      expiringCpCounterItem: (json['ExpiringCPCounterItem'] as num).toDouble(),
      cpTotalCreditsExpiryDate: json['CPTotalCreditsExpiryDate'],
      cpBonusExpiryDate: json['CPBonusExpiryDate'],
      cpLoyaltyExpiryDate: json['CPLoyaltyExpiryDate'],
      cpTicketsExpiryDate: json['CPTicketsExpiryDate'],
      cpCardBalanceExpiryDate: json['CPCardBalanceExpiryDate'],
      cpGamePlayCreditsExpiryDate: json['CPGamePlayCreditsExpiryDate'],
      cpCounterItemExpiryDate: json['CPCounterItemExpiryDate'],
      formattedCreditPlusCardBalance:
          json['FormattedCreditPlusCardBalance'] as String,
      formattedCreditPlusVirtualPointBalance:
          json['FormattedCreditPlusVirtualPointBalance'] as String,
      formattedCreditPlusGamePlayCredits:
          json['FormattedCreditPlusGamePlayCredits'] as String,
      formattedCreditPlusItemPurchase:
          json['FormattedCreditPlusItemPurchase'] as String,
      formattedCreditPlusBonus: json['FormattedCreditPlusBonus'] as String,
      formattedCreditPlusLoyaltyPoints:
          json['FormattedCreditPlusLoyaltyPoints'] as String,
      formattedCreditPlusTickets: json['FormattedCreditPlusTickets'] as String,
      formattedCreditPlusTime: json['FormattedCreditPlusTime'] as String,
      formattedCreditPlusRefundableBalance:
          json['FormattedCreditPlusRefundableBalance'] as String,
      formattedRedeemableCreditPlusLoyaltyPoints:
          json['FormattedRedeemableCreditPlusLoyaltyPoints'] as String,
      formattedTotalGamePlayCreditsBalance:
          json['FormattedTotalGamePlayCreditsBalance'] as String,
      formattedTotalBonusBalance: json['FormattedTotalBonusBalance'] as String,
      formattedTotalCourtesyBalance:
          json['FormattedTotalCourtesyBalance'] as String,
      formattedTotalTimeBalance: json['FormattedTotalTimeBalance'] as String,
      formattedTotalGamesBalance: json['FormattedTotalGamesBalance'] as String,
      formattedTotalTicketsBalance:
          json['FormattedTotalTicketsBalance'] as String,
      formattedTotalLoyaltyPointBalance:
          json['FormattedTotalLoyaltyPointBalance'] as String,
      formattedAccountExpiryDate: json['FormattedAccountExpiryDate'] as String,
    );

Map<String, dynamic> _$$_AccountSummaryDTOToJson(
        _$_AccountSummaryDTO instance) =>
    <String, dynamic>{
      'CreditPlusCardBalance': instance.creditPlusCardBalance,
      'CreditPlusGamePlayCredits': instance.creditPlusGamePlayCredits,
      'CreditPlusItemPurchase': instance.creditPlusItemPurchase,
      'CreditPlusBonus': instance.creditPlusBonus,
      'CreditPlusLoyaltyPoints': instance.creditPlusLoyaltyPoints,
      'CreditPlusTickets': instance.creditPlusTickets,
      'CreditPlusVirtualPoints': instance.creditPlusVirtualPoints,
      'CreditPlusTime': instance.creditPlusTime,
      'CreditPlusRefundableBalance': instance.creditPlusRefundableBalance,
      'RedeemableCreditPlusLoyaltyPoints':
          instance.redeemableCreditPlusLoyaltyPoints,
      'AccountGameBalance': instance.accountGameBalance,
      'TotalGamePlayCreditsBalance': instance.totalGamePlayCreditsBalance,
      'TotalBonusBalance': instance.totalBonusBalance,
      'TotalCourtesyBalance': instance.totalCourtesyBalance,
      'TotalTimeBalance': instance.totalTimeBalance,
      'TotalVirtualPointBalance': instance.totalVirtualPointBalance,
      'TotalGamesBalance': instance.totalGamesBalance,
      'TotalTicketsBalance': instance.totalTicketsBalance,
      'TotalLoyaltyPointBalance': instance.totalLoyaltyPointBalance,
      'AccountExpiryDate': instance.accountExpiryDate,
      'ExpiringCPTotalCredits': instance.expiringCpTotalCredits,
      'ExpiringCPBonus': instance.expiringCpBonus,
      'ExpiringCPLoyalty': instance.expiringCpLoyalty,
      'ExpiringCPTickets': instance.expiringCpTickets,
      'ExpiringCPCardBalance': instance.expiringCpCardBalance,
      'ExpiringCPGamePlayCredits': instance.expiringCpGamePlayCredits,
      'ExpiringCPCounterItem': instance.expiringCpCounterItem,
      'CPTotalCreditsExpiryDate': instance.cpTotalCreditsExpiryDate,
      'CPBonusExpiryDate': instance.cpBonusExpiryDate,
      'CPLoyaltyExpiryDate': instance.cpLoyaltyExpiryDate,
      'CPTicketsExpiryDate': instance.cpTicketsExpiryDate,
      'CPCardBalanceExpiryDate': instance.cpCardBalanceExpiryDate,
      'CPGamePlayCreditsExpiryDate': instance.cpGamePlayCreditsExpiryDate,
      'CPCounterItemExpiryDate': instance.cpCounterItemExpiryDate,
      'FormattedCreditPlusCardBalance': instance.formattedCreditPlusCardBalance,
      'FormattedCreditPlusVirtualPointBalance':
          instance.formattedCreditPlusVirtualPointBalance,
      'FormattedCreditPlusGamePlayCredits':
          instance.formattedCreditPlusGamePlayCredits,
      'FormattedCreditPlusItemPurchase':
          instance.formattedCreditPlusItemPurchase,
      'FormattedCreditPlusBonus': instance.formattedCreditPlusBonus,
      'FormattedCreditPlusLoyaltyPoints':
          instance.formattedCreditPlusLoyaltyPoints,
      'FormattedCreditPlusTickets': instance.formattedCreditPlusTickets,
      'FormattedCreditPlusTime': instance.formattedCreditPlusTime,
      'FormattedCreditPlusRefundableBalance':
          instance.formattedCreditPlusRefundableBalance,
      'FormattedRedeemableCreditPlusLoyaltyPoints':
          instance.formattedRedeemableCreditPlusLoyaltyPoints,
      'FormattedTotalGamePlayCreditsBalance':
          instance.formattedTotalGamePlayCreditsBalance,
      'FormattedTotalBonusBalance': instance.formattedTotalBonusBalance,
      'FormattedTotalCourtesyBalance': instance.formattedTotalCourtesyBalance,
      'FormattedTotalTimeBalance': instance.formattedTotalTimeBalance,
      'FormattedTotalGamesBalance': instance.formattedTotalGamesBalance,
      'FormattedTotalTicketsBalance': instance.formattedTotalTicketsBalance,
      'FormattedTotalLoyaltyPointBalance':
          instance.formattedTotalLoyaltyPointBalance,
      'FormattedAccountExpiryDate': instance.formattedAccountExpiryDate,
    };
