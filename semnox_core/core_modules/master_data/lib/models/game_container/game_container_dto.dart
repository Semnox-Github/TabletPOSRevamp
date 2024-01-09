
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_container_dto.freezed.dart';
part 'game_container_dto.g.dart';

@freezed
class GameContainerDTO with _$GameContainerDTO{
  const factory GameContainerDTO({
    @JsonKey(name: 'GameId')
    required int? gameId,
    @JsonKey(name: 'GameName')
    required String? gameName,
    @JsonKey(name: 'GameDescription')
    required String? gameDescription,
    @JsonKey(name: 'GameCompanyName')
    String? gameCompanyName,
    @JsonKey(name: 'PlayCredits')
    dynamic? playCredits,
    @JsonKey(name: 'VipPlayCredits')
    dynamic? vipPlayCredits,
    @JsonKey(name: 'Notes')
    String? notes,
    @JsonKey(name: 'GameProfileId')
    int? gameProfileId,
    @JsonKey(name: 'InternetKey')
    int? internetKey,
    @JsonKey(name: 'RepeatPlayDiscount')
    double? repeatPlayDiscount,
    @JsonKey(name: 'UserIdentifier')
    int? userIdentifier,
    @JsonKey(name: 'CustomDataSetId')
    int? customDataSetId,
    @JsonKey(name: 'ProductId')
    int? productId,
    @JsonKey(name: 'GameTag')
    String? gameTag,
    }) = _GameContainerDTO;

  factory GameContainerDTO.fromJson(Map<String, dynamic> json) => _$GameContainerDTOFromJson(json);
}