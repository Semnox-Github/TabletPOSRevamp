// ignore_for_file: invalid_annotation_target

import 'package:customer_data/models/account_details/account_credit_plus_dto.dart';
import 'package:customer_data/models/account_details/account_summary_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_discount_dto.freezed.dart';
part 'account_discount_dto.g.dart';

@freezed
class AccountDiscountData with _$AccountDiscountData {
  const factory AccountDiscountData({
    @JsonKey(name: 'AccountDiscountId')
    required int accountDiscountId,
    @JsonKey(name: 'AccountId')
    required int accountId,
    @JsonKey(name: 'DiscountId')
    required int discountId,
    @JsonKey(name: 'ExpiryDate')
     String? expiryDate,
    @JsonKey(name: 'CreatedBy')
    String? CreatedBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedUser')
    String? lastUpdatedUser,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'InternetKey')
    required int internetKey,
    @JsonKey(name: 'AccountTypeId')
    required int accountTypeId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'LineId')
    required int lineId,
    @JsonKey(name: 'TaskId')
    required int taskId,
    @JsonKey(name: 'ObligationStatus')
    String? obligationStatus,
    @JsonKey(name: 'ObligationStatusId')
    required int obligationStatusId,
    @JsonKey(name: 'ObligationStatusChangeDate')
    String? obligationStatusChangeDate,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'ExpireWithMembership')
    String? expireWithMembership,
    @JsonKey(name: 'ValidityStatus')
    required int validityStatus,
    @JsonKey(name: 'MembershipRewardsId')
    required int membershipRewardsId,
    @JsonKey(name: 'MembershipId')
    required int membershipId,
    @JsonKey(name: 'SubscriptionBillingScheduleId')
    required int subscriptionBillingScheduleId,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
  }) = _AccountDiscountData;

  factory AccountDiscountData.fromJson(Map<String, dynamic> json) => _$AccountDiscountDataFromJson(json);
}