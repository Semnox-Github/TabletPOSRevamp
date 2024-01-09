// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:product_menu_data/models/product_price_container/product_games_extended_dto.dart';


part 'product_games_container_dto.freezed.dart';
part 'product_games_container_dto.g.dart';

@freezed
class ProductGamesContainerDTO with _$ProductGamesContainerDTO {
  const factory ProductGamesContainerDTO({
    @JsonKey(name: 'Product_game_id')
    required int productGameId,
    @JsonKey(name: 'Product_id')
    required int productId,
    @JsonKey(name: 'Game_id')
    required int gameId,
    @JsonKey(name: 'Quantity')
    double? quantity,
    @JsonKey(name: 'ValidFor')
    double? validFor,
    @JsonKey(name: 'ExpiryDate')
    dynamic expiryDate,
    @JsonKey(name: 'ValidMinutesDays')
    required String validMinutesDays,
    @JsonKey(name: 'Game_profile_id')
    required int gameProfileId,
    @JsonKey(name: 'Frequency')
    required String frequency,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'CardTypeId')
    required int cardTypeId,
    @JsonKey(name: 'EntitlementType')
    required String entitlementType,
    @JsonKey(name: 'OptionalAttribute')
    required String optionalAttribute,
    @JsonKey(name: 'ExpiryTime')
    dynamic expiryTime,
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'TicketAllowed')
    required bool ticketAllowed,
    @JsonKey(name: 'EffectiveAfterDays')
    dynamic effectiveAfterDays,
    @JsonKey(name: 'FromDate')
    dynamic fromDate,
    @JsonKey(name: 'Monday')
    required bool monday,
    @JsonKey(name: 'Tuesday')
    required bool tuesday,
    @JsonKey(name: 'Wednesday')
    required bool wednesday,
    @JsonKey(name: 'Thursday')
    required bool thursday,
    @JsonKey(name: 'Friday')
    required bool friday,
    @JsonKey(name: 'Saturday')
    required bool saturday,
    @JsonKey(name: 'Sunday')
    required bool sunday,
    @JsonKey(name: 'ProductGamesExtendedContainerDTOList')
    required List<ProductGamesExtendedContainerDTO> productGamesExtendedContainerDTOList,
    @JsonKey(name: 'EntityOverrideDateContainerDTOList')
    dynamic entityOverrideDateContainerDTOList,
  }) = _ProductGamesContainerDTO;

  factory ProductGamesContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductGamesContainerDTOFromJson(json);
}
