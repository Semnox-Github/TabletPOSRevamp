
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_profile_container_dto.freezed.dart';
part 'game_profile_container_dto.g.dart';

@freezed
class GameProfileContainerDTO with _$GameProfileContainerDTO{
  const factory GameProfileContainerDTO({
    @JsonKey(name: 'GameProfileId')
    required int gameProfileId,
    @JsonKey(name: 'ProfileName')
    required String profileName,
    @JsonKey(name: 'CreditAllowed')
    required String creditAllowed,
    @JsonKey(name: 'BonusAllowed')
    required String bonusAllowed,
    @JsonKey(name: 'CourtesyAllowed')
    required String courtesyAllowed,
    @JsonKey(name: 'TimeAllowed')
    required String timeAllowed,
    @JsonKey(name: 'TicketAllowedOnCredit')
    required String ticketAllowedOnCredit,
    @JsonKey(name: 'TicketAllowedOnCourtesy')
    required String ticketAllowedOnCourtesy,
    @JsonKey(name: 'TicketAllowedOnBonus')
    required String ticketAllowedOnBonus,
    @JsonKey(name: 'TicketAllowedOnTime')
    required String ticketAllowedOnTime,
    @JsonKey(name: 'PlayCredits')
    required double playCredits,
    @JsonKey(name: 'VipPlayCredits')
    required double vipPlayCredits,
    @JsonKey(name: 'InternetKey')
    required int internetKey,
    @JsonKey(name: 'RedemptionToken')
    required String redemptionToken,
    @JsonKey(name: 'PhysicalToken')
    required String physicalToken,
    @JsonKey(name: 'TokenPrice')
    required double tokenPrice,
    @JsonKey(name: 'RedeemTokenTo')
    required String redeemTokenTo,
    @JsonKey(name: 'ThemeNumber')
    required int themeNumber,
    @JsonKey(name: 'ThemeId')
    required int themeId,
    @JsonKey(name: 'ShowAd')
    required String showAd,
    @JsonKey(name: 'IsTicketEater')
    required String isTicketEater,
    @JsonKey(name: 'UserIdentifier')
    required int userIdentifier,
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'ForceRedeemToCard')
    required bool forceRedeemToCard,
    @JsonKey(name: 'TokenRedemption')
    required int tokenRedemption,
    @JsonKey(name: 'ProfileIdentifier')
    required String profileIdentifier,
  }) = _GameProfileContainerDTO;

  factory GameProfileContainerDTO.fromJson(Map<String, dynamic> json) => _$GameProfileContainerDTOFromJson(json);
}