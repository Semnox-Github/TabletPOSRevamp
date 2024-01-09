// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_balance_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferBalanceData _$$_TransferBalanceDataFromJson(
        Map<String, dynamic> json) =>
    _$_TransferBalanceData(
      sourceAccountId: json['SourceAccountId'] as int?,
      destinationAccountId: json['DestinationAccountId'] as int?,
      valueLoaded: (json['ValueLoaded'] as num?)?.toDouble(),
      remarks: json['Remarks'] as String?,
      activityDate: json['ActivityDate'] as String?,
      sourceAccountNumber: json['SourceAccountNumber'] as String?,
      destinationAccountNumber: json['DestinationAccountNumber'] as String?,
      pOSMachineId: json['POSMachineId'] as int?,
      userId: json['UserId'] as int?,
      approvedBy: json['ApprovedBy'] as String?,
      approvalDate: json['ApprovalDate'] as String?,
      entitlementType: json['EntitlementType'] as String?,
    );

Map<String, dynamic> _$$_TransferBalanceDataToJson(
        _$_TransferBalanceData instance) =>
    <String, dynamic>{
      'SourceAccountId': instance.sourceAccountId,
      'DestinationAccountId': instance.destinationAccountId,
      'ValueLoaded': instance.valueLoaded,
      'Remarks': instance.remarks,
      'ActivityDate': instance.activityDate,
      'SourceAccountNumber': instance.sourceAccountNumber,
      'DestinationAccountNumber': instance.destinationAccountNumber,
      'POSMachineId': instance.pOSMachineId,
      'UserId': instance.userId,
      'ApprovedBy': instance.approvedBy,
      'ApprovalDate': instance.approvalDate,
      'EntitlementType': instance.entitlementType,
    };
