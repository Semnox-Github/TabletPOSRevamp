// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_transaction_logs_data.freezed.dart';
part 'get_transaction_logs_data.g.dart';

@freezed
class GetTransactionLogsData with _$GetTransactionLogsData {
  const factory GetTransactionLogsData({
    @JsonKey(name: 'TrxUserLogId') required int trxUserLogId,
    @JsonKey(name: 'TrxId') required int trxId,
    @JsonKey(name: 'ObjectType') required String objectType,
    @JsonKey(name: 'ObjectGuid') required String objectGuid,
    @JsonKey(name: 'LoginId') required String loginId,
    @JsonKey(name: 'UserId') required int userId,
    @JsonKey(name: 'ActivityDate') required String activityDate,
    @JsonKey(name: 'PosMachineId') required int posMachineId,
    @JsonKey(name: 'Action') required String action,
    @JsonKey(name: 'Activity') required String activity,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreationDate') required String creationDate,
    @JsonKey(name: 'LastUpdatedBy') required String lastUpdatedBy,
    @JsonKey(name: 'LastupdateDate') required String lastupdateDate,
    @JsonKey(name: 'SiteId') required int siteId,
    @JsonKey(name: 'SynchStatus') required bool synchStatus,
    @JsonKey(name: 'MasterEntityId') required int masterEntityId,
    @JsonKey(name: 'ApproverId') required String approverId,
    @JsonKey(name: 'ApproverPKId') required int approverPKId,
    @JsonKey(name: 'ApprovalTime')  String? approvalTime,
    @JsonKey(name: 'IsChanged') required bool isChanged,
  }) = _GetTransactionLogsData;

  factory GetTransactionLogsData.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionLogsDataFromJson(json);
}
