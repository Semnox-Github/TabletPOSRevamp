import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_game_extended_dto.freezed.dart';
part 'account_game_extended_dto.g.dart';

@freezed
class AccountGameExtendedDTO with _$AccountGameExtendedDTO{
  const factory AccountGameExtendedDTO({
    @JsonKey(name: 'GameProfileId')
    required int gameProfileId,
    @JsonKey(name: 'GameId')
    required int gameId,
    @JsonKey(name: 'Exclude')
    dynamic? exclude,

  }) = _AccountGameExtendedDTO;

  factory AccountGameExtendedDTO.fromJson(Map<String, dynamic> json) => _$AccountGameExtendedDTOFromJson(json);
}