// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transaction_logs_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetTransactionLogsData _$$_GetTransactionLogsDataFromJson(
        Map<String, dynamic> json) =>
    _$_GetTransactionLogsData(
      trxUserLogId: json['TrxUserLogId'] as int,
      trxId: json['TrxId'] as int,
      objectType: json['ObjectType'] as String,
      objectGuid: json['ObjectGuid'] as String,
      loginId: json['LoginId'] as String,
      userId: json['UserId'] as int,
      activityDate: json['ActivityDate'] as String,
      posMachineId: json['PosMachineId'] as int,
      action: json['Action'] as String,
      activity: json['Activity'] as String,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastupdateDate: json['LastupdateDate'] as String,
      siteId: json['SiteId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      masterEntityId: json['MasterEntityId'] as int,
      approverId: json['ApproverId'] as String,
      approverPKId: json['ApproverPKId'] as int,
      approvalTime: json['ApprovalTime'] as String?,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_GetTransactionLogsDataToJson(
        _$_GetTransactionLogsData instance) =>
    <String, dynamic>{
      'TrxUserLogId': instance.trxUserLogId,
      'TrxId': instance.trxId,
      'ObjectType': instance.objectType,
      'ObjectGuid': instance.objectGuid,
      'LoginId': instance.loginId,
      'UserId': instance.userId,
      'ActivityDate': instance.activityDate,
      'PosMachineId': instance.posMachineId,
      'Action': instance.action,
      'Activity': instance.activity,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastupdateDate': instance.lastupdateDate,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'ApproverId': instance.approverId,
      'ApproverPKId': instance.approverPKId,
      'ApprovalTime': instance.approvalTime,
      'IsChanged': instance.isChanged,
    };
