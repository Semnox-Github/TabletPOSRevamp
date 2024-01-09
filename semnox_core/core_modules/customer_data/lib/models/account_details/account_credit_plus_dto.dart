// ignore_for_file: invalid_annotation_target

import 'package:customer_data/models/account_details/account_credit_plus_consumption_dto.dart';
import 'package:customer_data/models/account_details/account_credit_plus_purchase_criteria_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_credit_plus_dto.freezed.dart';
part 'account_credit_plus_dto.g.dart';

@freezed
class AccountCreditPlusDTO with _$AccountCreditPlusDTO {
  const factory AccountCreditPlusDTO({
    @JsonKey(name: 'AccountCreditPlusId') required int accountCreditPlusId,
    @JsonKey(name: 'AccountId') required int accountId,
    @JsonKey(name: 'CreditPlusType') required int creditPlusType,
    @JsonKey(name: 'CreditPlus') double? creditPlus,
    @JsonKey(name: 'CreditPlusBalance') required double creditPlusBalance,
    @JsonKey(name: 'PeriodFrom') String? periodFrom,
    @JsonKey(name: 'PeriodTo') String? periodTo,
    @JsonKey(name: 'ExtendOnReload') required bool extendOnReload,
    @JsonKey(name: 'Refundable') required bool refundable,
    @JsonKey(name: 'TimeFrom') dynamic timeFrom,
    @JsonKey(name: 'TimeTo') dynamic timeTo,
    @JsonKey(name: 'Monday') required bool monday,
    @JsonKey(name: 'Tuesday') required bool tuesday,
    @JsonKey(name: 'Wednesday') required bool wednesday,
    @JsonKey(name: 'Thursday') required bool thursday,
    @JsonKey(name: 'Friday') required bool friday,
    @JsonKey(name: 'Saturday') required bool saturday,
    @JsonKey(name: 'Sunday') required bool sunday,
    @JsonKey(name: 'TicketAllowed') required bool ticketAllowed,
    @JsonKey(name: 'PauseAllowed') required bool pauseAllowed,
    @JsonKey(name: 'Remarks') required String remarks,
    @JsonKey(name: 'ExpireWithMembership') required bool expireWithMembership,
    @JsonKey(name: 'TransactionId') required int transactionId,
    @JsonKey(name: 'TransactionLineId') required int transactionLineId,
    @JsonKey(name: 'NumberOfDays') int? numberOfDays,
    @JsonKey(name: 'MinimumSaleAmount') dynamic minimumSaleAmount,
    @JsonKey(name: 'LoyaltyRuleId') required int loyaltyRuleId,
    @JsonKey(name: 'PlayStartTime') String? playStartTime,
    @JsonKey(name: 'ValidityStatus') required int validityStatus,
    @JsonKey(name: 'ForMembershipOnly') required bool forMembershipOnly,
    @JsonKey(name: 'MembershipId') required int membershipId,
    @JsonKey(name: 'MembershipRewardsId') required int membershipRewardsId,
    @JsonKey(name: 'ObligationStatus') required String obligationStatus,
    @JsonKey(name: 'ObligationStatusId') required int obligationStatusId,
    @JsonKey(name: 'ObligationStatusChangeDate')
        dynamic obligationStatusChangeDate,
    @JsonKey(name: 'CreationDate') required String creationDate,
    @JsonKey(name: 'LastUpdatedBy') required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate') required String lastUpdateDate,
    @JsonKey(name: 'SiteId') required int siteId,
    @JsonKey(name: 'MasterEntityId') required int masterEntityId,
    @JsonKey(name: 'SynchStatus') required bool synchStatus,
    @JsonKey(name: 'Guid') required String guid,
    @JsonKey(name: 'IsActive') required bool isActive,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'AccountCreditPlusConsumptionDTOList')
    required List<AccountCreditPlusConsumptionDTO>?
            accountCreditPlusConsumptionDTOList,
    @JsonKey(name: 'AccountCreditPlusPurchaseCriteriaDTOList')
    required List<AccountCreditPlusPurchaseCriteriaDTO>?
        accountCreditPlusPurchaseCriteriaDTOList,
    @JsonKey(name: 'EntityOverrideDatesDTOList')
    required List<dynamic> entityOverrideDatesDTOList,
    @JsonKey(name: 'IsChanged') required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive') required bool isChangedRecursive,
    @JsonKey(name: 'SourceCreditPlusId') required int sourceCreditPlusId,
    @JsonKey(name: 'SubscriptionBillingScheduleId')
        required int subscriptionBillingScheduleId,
  }) = _AccountCreditPlusDTO;

  factory AccountCreditPlusDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountCreditPlusDTOFromJson(json);
}
