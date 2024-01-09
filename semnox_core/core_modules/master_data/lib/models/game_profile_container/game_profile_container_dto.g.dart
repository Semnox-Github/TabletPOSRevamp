// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_profile_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameProfileContainerDTO _$$_GameProfileContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_GameProfileContainerDTO(
      gameProfileId: json['GameProfileId'] as int,
      profileName: json['ProfileName'] as String,
      creditAllowed: json['CreditAllowed'] as String,
      bonusAllowed: json['BonusAllowed'] as String,
      courtesyAllowed: json['CourtesyAllowed'] as String,
      timeAllowed: json['TimeAllowed'] as String,
      ticketAllowedOnCredit: json['TicketAllowedOnCredit'] as String,
      ticketAllowedOnCourtesy: json['TicketAllowedOnCourtesy'] as String,
      ticketAllowedOnBonus: json['TicketAllowedOnBonus'] as String,
      ticketAllowedOnTime: json['TicketAllowedOnTime'] as String,
      playCredits: (json['PlayCredits'] as num).toDouble(),
      vipPlayCredits: (json['VipPlayCredits'] as num).toDouble(),
      internetKey: json['InternetKey'] as int,
      redemptionToken: json['RedemptionToken'] as String,
      physicalToken: json['PhysicalToken'] as String,
      tokenPrice: (json['TokenPrice'] as num).toDouble(),
      redeemTokenTo: json['RedeemTokenTo'] as String,
      themeNumber: json['ThemeNumber'] as int,
      themeId: json['ThemeId'] as int,
      showAd: json['ShowAd'] as String,
      isTicketEater: json['IsTicketEater'] as String,
      userIdentifier: json['UserIdentifier'] as int,
      customDataSetId: json['CustomDataSetId'] as int,
      forceRedeemToCard: json['ForceRedeemToCard'] as bool,
      tokenRedemption: json['TokenRedemption'] as int,
      profileIdentifier: json['ProfileIdentifier'] as String,
    );

Map<String, dynamic> _$$_GameProfileContainerDTOToJson(
        _$_GameProfileContainerDTO instance) =>
    <String, dynamic>{
      'GameProfileId': instance.gameProfileId,
      'ProfileName': instance.profileName,
      'CreditAllowed': instance.creditAllowed,
      'BonusAllowed': instance.bonusAllowed,
      'CourtesyAllowed': instance.courtesyAllowed,
      'TimeAllowed': instance.timeAllowed,
      'TicketAllowedOnCredit': instance.ticketAllowedOnCredit,
      'TicketAllowedOnCourtesy': instance.ticketAllowedOnCourtesy,
      'TicketAllowedOnBonus': instance.ticketAllowedOnBonus,
      'TicketAllowedOnTime': instance.ticketAllowedOnTime,
      'PlayCredits': instance.playCredits,
      'VipPlayCredits': instance.vipPlayCredits,
      'InternetKey': instance.internetKey,
      'RedemptionToken': instance.redemptionToken,
      'PhysicalToken': instance.physicalToken,
      'TokenPrice': instance.tokenPrice,
      'RedeemTokenTo': instance.redeemTokenTo,
      'ThemeNumber': instance.themeNumber,
      'ThemeId': instance.themeId,
      'ShowAd': instance.showAd,
      'IsTicketEater': instance.isTicketEater,
      'UserIdentifier': instance.userIdentifier,
      'CustomDataSetId': instance.customDataSetId,
      'ForceRedeemToCard': instance.forceRedeemToCard,
      'TokenRedemption': instance.tokenRedemption,
      'ProfileIdentifier': instance.profileIdentifier,
    };
