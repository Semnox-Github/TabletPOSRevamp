
import 'package:customer_data/models/account_details/account_game_extended_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_game_dto.freezed.dart';
part 'account_game_dto.g.dart';

@freezed
class AccountGameDTO with _$AccountGameDTO{
  const factory AccountGameDTO({
    @JsonKey(name: 'AccountGameId')
    required int accountGameId,
    @JsonKey(name: 'GameProfileId')
    required int gameProfileId,
    @JsonKey(name: 'GameId')
    required int gameId,
    @JsonKey(name: 'Quantity')
    required double quantity,
    @JsonKey(name: 'Frequency')
    required String frequency,
    @JsonKey(name: 'BalanceGames')
    required int balanceGames,
    @JsonKey(name: 'LastPlayedTime')
    required dynamic? lastPlayedTime,
    @JsonKey(name: 'FromDate')
    required String fromDate,
    @JsonKey(name: 'ExpiryDate')
    required String expiryDate,
    @JsonKey(name: 'EntitlementType')
    required String entitlementType,
    @JsonKey(name: 'TicketAllowed')
    required bool ticketAllowed,
    @JsonKey(name: 'OptionalAttribute')
    required String optionalAttribute,
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
    @JsonKey(name: 'ExpireWithMembership')
    required bool expireWithMembership,
    @JsonKey(name: 'ValidityStatus')
    required int validityStatus,
    @JsonKey(name: 'AccountId')
    required int accountId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'MembershipId')
    required int membershipId,
    @JsonKey(name: 'MembershipRewardsId')
    required int membershipRewardsId,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'ObligationStatus')
    required String obligationStatus,
    @JsonKey(name: 'ObligationStatusId')
    required int obligationStatusId,
    @JsonKey(name: 'ObligationStatusChangeDate')
    required String obligationStatusChangeDate,
    @JsonKey(name: 'AccountGameExtendedDTOList')
    List<AccountGameExtendedDTO>? accountGameExtendedDTOList,
    @JsonKey(name: 'EntityOverrideDatesDTOList')
    dynamic? entityOverrideDatesDTOList,
    @JsonKey(name: 'SubscriptionBillingScheduleId')
    required int subscriptionBillingScheduleId,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,

  }) = _AccountGameDTO;

  factory AccountGameDTO.fromJson(Map<String, dynamic> json) => _$AccountGameDTOFromJson(json);
}