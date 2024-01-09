// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'product_games_extended_dto.freezed.dart';
part 'product_games_extended_dto.g.dart';

@freezed
class ProductGamesExtendedContainerDTO with _$ProductGamesExtendedContainerDTO {
  const factory ProductGamesExtendedContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'ProductGameId')
    required int productGameId,
    @JsonKey(name: 'GameId')
    required int gameId,
    @JsonKey(name: 'GameProfileId')
    required int gameProfileId,
    @JsonKey(name: 'Exclude')
    required bool exclude,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'PlayLimitPerGame')
    dynamic playLimitPerGame,
  }) = _ProductGamesExtendedContainerDTO;

  factory ProductGamesExtendedContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductGamesExtendedContainerDTOFromJson(json);
}
