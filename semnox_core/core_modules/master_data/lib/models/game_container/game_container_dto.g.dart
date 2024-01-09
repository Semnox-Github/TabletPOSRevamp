// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameContainerDTO _$$_GameContainerDTOFromJson(Map<String, dynamic> json) =>
    _$_GameContainerDTO(
      gameId: json['GameId'] as int?,
      gameName: json['GameName'] as String?,
      gameDescription: json['GameDescription'] as String?,
      gameCompanyName: json['GameCompanyName'] as String?,
      playCredits: json['PlayCredits'],
      vipPlayCredits: json['VipPlayCredits'],
      notes: json['Notes'] as String?,
      gameProfileId: json['GameProfileId'] as int?,
      internetKey: json['InternetKey'] as int?,
      repeatPlayDiscount: (json['RepeatPlayDiscount'] as num?)?.toDouble(),
      userIdentifier: json['UserIdentifier'] as int?,
      customDataSetId: json['CustomDataSetId'] as int?,
      productId: json['ProductId'] as int?,
      gameTag: json['GameTag'] as String?,
    );

Map<String, dynamic> _$$_GameContainerDTOToJson(_$_GameContainerDTO instance) =>
    <String, dynamic>{
      'GameId': instance.gameId,
      'GameName': instance.gameName,
      'GameDescription': instance.gameDescription,
      'GameCompanyName': instance.gameCompanyName,
      'PlayCredits': instance.playCredits,
      'VipPlayCredits': instance.vipPlayCredits,
      'Notes': instance.notes,
      'GameProfileId': instance.gameProfileId,
      'InternetKey': instance.internetKey,
      'RepeatPlayDiscount': instance.repeatPlayDiscount,
      'UserIdentifier': instance.userIdentifier,
      'CustomDataSetId': instance.customDataSetId,
      'ProductId': instance.productId,
      'GameTag': instance.gameTag,
    };
