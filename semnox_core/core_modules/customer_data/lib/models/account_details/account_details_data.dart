// ignore_for_file: invalid_annotation_target

import 'package:customer_data/models/account_details/account_credit_plus_dto.dart';
import 'package:customer_data/models/account_details/account_relationship_dto_list.dart';
import 'package:customer_data/models/account_details/account_summary_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_discount_dto.dart';
import 'account_game_dto.dart';

part 'account_details_data.freezed.dart';
part 'account_details_data.g.dart';

@freezed
class AccountDetailsData with _$AccountDetailsData {
  const factory AccountDetailsData({
    @JsonKey(name: 'AccountId') required int accountId,
    @JsonKey(name: 'TagNumber') required String tagNumber,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'IssueDate') String? issueDate,
    @JsonKey(name: 'FaceValue') dynamic faceValue,
    @JsonKey(name: 'Credits') double? credits,
    @JsonKey(name: 'Courtesy') double? courtesy,
    @JsonKey(name: 'Bonus') double? bonus,
    @JsonKey(name: 'Time') double? time,
    @JsonKey(name: 'TicketCount') int? ticketCount,
    @JsonKey(name: 'LoyaltyPoints') double? loyaltyPoints,
    @JsonKey(name: 'CreditsPlayed') double? creditsPlayed,
    @JsonKey(name: 'RealTicketMode') bool? realTicketMode,
    @JsonKey(name: 'VipCustomer') bool? vipCustomer,
    @JsonKey(name: 'TicketAllowed') bool? ticketAllowed,
    @JsonKey(name: 'TechnicianCard') String? technicianCard,
    @JsonKey(name: 'TimerResetCard') bool? timerResetCard,
    @JsonKey(name: 'TechGames') dynamic techGames,
    @JsonKey(name: 'ValidFlag') bool? validFlag,
    @JsonKey(name: 'RefundFlag') bool? refundFlag,
    @JsonKey(name: 'RefundAmount') dynamic refundAmount,
    @JsonKey(name: 'RefundDate') dynamic refundDate,
    @JsonKey(name: 'ExpiryDate') dynamic expiryDate,
    @JsonKey(name: 'StartTime') String? startTime,
    @JsonKey(name: 'LastPlayedTime') String? lastPlayedTime,
    @JsonKey(name: 'Notes') String? notes,
    @JsonKey(name: 'LastUpdateDate') String? lastUpdateDate,
    @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
    @JsonKey(name: 'PrimaryAccount') bool? primaryAccount,
    @JsonKey(name: 'AccountIdentifier') String? accountIdentifier,
    @JsonKey(name: 'MembershipName') String? membershipName,
    @JsonKey(name: 'ObligationStatus') String? obligationStatus,
    @JsonKey(name: 'AccountType') String? accountType,
    @JsonKey(name: 'ObligationStatusId') int? obligationStatusId,
    @JsonKey(name: 'ObligationStatusChangeDate')
        dynamic obligationStatusChangeDate,
    @JsonKey(name: 'MembershipId') int? membershipId,
    @JsonKey(name: 'CustomerId') int? customerId,
    @JsonKey(name: 'UploadSiteId') int? uploadSiteId,
    @JsonKey(name: 'UploadTime') String? uploadTime,
    @JsonKey(name: 'DownloadBatchId') int? downloadBatchId,
    @JsonKey(name: 'RefreshFromHQTime') String? refreshFromHqTime,
    @JsonKey(name: 'SiteId') int? siteId,
    @JsonKey(name: 'MasterEntityId') int? masterEntityId,
    @JsonKey(name: 'SynchStatus') bool? synchStatus,
    @JsonKey(name: 'Guid') String? guid,
    @JsonKey(name: 'CreationDate') String? creationDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'AccountDiscountDTOList')
        List<AccountDiscountData>? accountDiscountDTOList,
    @JsonKey(name: 'AccountCreditPlusDTOList')
        List<AccountCreditPlusDTO>? accountCreditPlusDTOList,
    @JsonKey(name: 'AccountGameDTOList')
        List<AccountGameDTO>? accountGameDTOList,
    @JsonKey(name: 'AccountRelationshipDTOList')
        List<AccountRelationshipDTOList>? accountRelationshipDTOList,
    @JsonKey(name: 'RefundAccountGameDTOList') dynamic refundAccountGameDTOList,
    @JsonKey(name: 'RefundAccountCreditPlusDTOList')
        dynamic refundAccountCreditPlusDTOList,
    @JsonKey(name: 'GamePlayDTOList') dynamic gamePlayDTOList,
    @JsonKey(name: 'AccountActivityDTOList') dynamic accountActivityDTOList,
    @JsonKey(name: 'AccountSummaryDTO') AccountSummaryDTO? accountSummaryDTO,
    @JsonKey(name: 'TotalCreditPlusBalance') double? totalCreditPlusBalance,
    @JsonKey(name: 'IsChanged') bool? isChanged,
    @JsonKey(name: 'TotalCreditsBalance') double? totalCreditsBalance,
    @JsonKey(name: 'TotalBonusBalance') double? totalBonusBalance,
    @JsonKey(name: 'TotalCourtesyBalance') double? totalCourtesyBalance,
    @JsonKey(name: 'TotalTimeBalance') double? totalTimeBalance,
    @JsonKey(name: 'TotalGamesBalance') double? totalGamesBalance,
    @JsonKey(name: 'TotalTicketsBalance') double? totalTicketsBalance,
    @JsonKey(name: 'TotalVirtualPointBalance') double? totalVirtualPointBalance,
    @JsonKey(name: 'IsChangedRecursive') bool? isChangedRecursive,
  }) = _AccountDetailsData;

  factory AccountDetailsData.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsDataFromJson(json);
}
