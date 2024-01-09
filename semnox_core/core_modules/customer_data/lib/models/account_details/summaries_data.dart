// ignore_for_file: invalid_annotation_target

import 'package:customer_data/models/customer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summaries_data.freezed.dart';
part 'summaries_data.g.dart';

@freezed
class SummariesData with _$SummariesData {
  const factory SummariesData({
    @JsonKey(name: 'GameplayId')
    int? gameplayId,
    @JsonKey(name: 'MachineId')
    int? machineId,
    @JsonKey(name: 'CardId')
    int? cardId,
    @JsonKey(name: 'CardNumber')
    String? cardNumber,
    @JsonKey(name: 'Credits')
    double? credits,
    @JsonKey(name: 'Courtesy')
    double? courtesy,
    @JsonKey(name: 'Bonus')
    double? bonus,
    @JsonKey(name: 'Time')
    double? time,
    @JsonKey(name: 'PlayDate')
    String? playDate,
    @JsonKey(name: 'Notes')
    String? notes,
    @JsonKey(name: 'TicketCount')
    int? ticketCount,
    @JsonKey(name: 'TicketMode')
    String? ticketMode,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'CardGame')
    double? cardGame,
    @JsonKey(name: 'CPCardBalance')
    double? cPCardBalance,
    @JsonKey(name: 'CPCredits')
    double? cPCredits,
    @JsonKey(name: 'CPBonus')
    double? cPBonus,
    @JsonKey(name: 'CardGameId')
    double? cardGameId,
    @JsonKey(name: 'PayoutCost')
    double? payoutCost,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'MultiGamePlayReference')
    String? multiGamePlayReference,
    @JsonKey(name: 'GamePriceTierInfo')
    String? gamePriceTierInfo,
    @JsonKey(name: 'GamePlayInfoDTOList')
    String? gamePlayInfoDTOList,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'PromotionId')
    int? promotionId,
    @JsonKey(name: 'PlayRequestTime')
    String? playRequestTime,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'Game')
    String? game,
    @JsonKey(name: 'Machine')
    String? machine,
    @JsonKey(name: 'ETickets')
    double? eTickets,
    @JsonKey(name: 'ManualTickets')
    double? manualTickets,
    @JsonKey(name: 'TicketEaterTickets')
    double? ticketEaterTickets,
    @JsonKey(name: 'Mode')
    String? mode,
    @JsonKey(name: 'Site')
    String? site,
    @JsonKey(name: 'TaskId')
    int? taskId,
    @JsonKey(name: 'ExternalSystemReference')
    String? externalSystemReference,
    @JsonKey(name: 'IsChangedRecursive')
    bool? isChangedRecursive,
    @JsonKey(name:'IsChanged')
    bool? isChanged,

  }) = _SummariesData;

  factory SummariesData.fromJson(Map<String, dynamic> json) => _$SummariesDataFromJson(json);

}