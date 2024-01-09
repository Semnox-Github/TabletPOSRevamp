// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_game_extended_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountGameExtendedDTO _$$_AccountGameExtendedDTOFromJson(
        Map<String, dynamic> json) =>
    _$_AccountGameExtendedDTO(
      gameProfileId: json['GameProfileId'] as int,
      gameId: json['GameId'] as int,
      exclude: json['Exclude'],
    );

Map<String, dynamic> _$$_AccountGameExtendedDTOToJson(
        _$_AccountGameExtendedDTO instance) =>
    <String, dynamic>{
      'GameProfileId': instance.gameProfileId,
      'GameId': instance.gameId,
      'Exclude': instance.exclude,
    };
