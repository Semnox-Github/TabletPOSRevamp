// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_games_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductGamesContainerDTO _$$_ProductGamesContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ProductGamesContainerDTO(
      productGameId: json['Product_game_id'] as int,
      productId: json['Product_id'] as int,
      gameId: json['Game_id'] as int,
      quantity: (json['Quantity'] as num?)?.toDouble(),
      validFor: (json['ValidFor'] as num?)?.toDouble(),
      expiryDate: json['ExpiryDate'],
      validMinutesDays: json['ValidMinutesDays'] as String,
      gameProfileId: json['Game_profile_id'] as int,
      frequency: json['Frequency'] as String,
      guid: json['Guid'] as String,
      cardTypeId: json['CardTypeId'] as int,
      entitlementType: json['EntitlementType'] as String,
      optionalAttribute: json['OptionalAttribute'] as String,
      expiryTime: json['ExpiryTime'],
      customDataSetId: json['CustomDataSetId'] as int,
      ticketAllowed: json['TicketAllowed'] as bool,
      effectiveAfterDays: json['EffectiveAfterDays'],
      fromDate: json['FromDate'],
      monday: json['Monday'] as bool,
      tuesday: json['Tuesday'] as bool,
      wednesday: json['Wednesday'] as bool,
      thursday: json['Thursday'] as bool,
      friday: json['Friday'] as bool,
      saturday: json['Saturday'] as bool,
      sunday: json['Sunday'] as bool,
      productGamesExtendedContainerDTOList:
          (json['ProductGamesExtendedContainerDTOList'] as List<dynamic>)
              .map((e) => ProductGamesExtendedContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      entityOverrideDateContainerDTOList:
          json['EntityOverrideDateContainerDTOList'],
    );

Map<String, dynamic> _$$_ProductGamesContainerDTOToJson(
        _$_ProductGamesContainerDTO instance) =>
    <String, dynamic>{
      'Product_game_id': instance.productGameId,
      'Product_id': instance.productId,
      'Game_id': instance.gameId,
      'Quantity': instance.quantity,
      'ValidFor': instance.validFor,
      'ExpiryDate': instance.expiryDate,
      'ValidMinutesDays': instance.validMinutesDays,
      'Game_profile_id': instance.gameProfileId,
      'Frequency': instance.frequency,
      'Guid': instance.guid,
      'CardTypeId': instance.cardTypeId,
      'EntitlementType': instance.entitlementType,
      'OptionalAttribute': instance.optionalAttribute,
      'ExpiryTime': instance.expiryTime,
      'CustomDataSetId': instance.customDataSetId,
      'TicketAllowed': instance.ticketAllowed,
      'EffectiveAfterDays': instance.effectiveAfterDays,
      'FromDate': instance.fromDate,
      'Monday': instance.monday,
      'Tuesday': instance.tuesday,
      'Wednesday': instance.wednesday,
      'Thursday': instance.thursday,
      'Friday': instance.friday,
      'Saturday': instance.saturday,
      'Sunday': instance.sunday,
      'ProductGamesExtendedContainerDTOList':
          instance.productGamesExtendedContainerDTOList,
      'EntityOverrideDateContainerDTOList':
          instance.entityOverrideDateContainerDTOList,
    };
