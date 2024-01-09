// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_games_extended_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductGamesExtendedContainerDTO
    _$$_ProductGamesExtendedContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_ProductGamesExtendedContainerDTO(
          id: json['Id'] as int,
          productGameId: json['ProductGameId'] as int,
          gameId: json['GameId'] as int,
          gameProfileId: json['GameProfileId'] as int,
          exclude: json['Exclude'] as bool,
          guid: json['Guid'] as String,
          playLimitPerGame: json['PlayLimitPerGame'],
        );

Map<String, dynamic> _$$_ProductGamesExtendedContainerDTOToJson(
        _$_ProductGamesExtendedContainerDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProductGameId': instance.productGameId,
      'GameId': instance.gameId,
      'GameProfileId': instance.gameProfileId,
      'Exclude': instance.exclude,
      'Guid': instance.guid,
      'PlayLimitPerGame': instance.playLimitPerGame,
    };
