// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_tip_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeTipData _$$_EmployeeTipDataFromJson(Map<String, dynamic> json) =>
    _$_EmployeeTipData(
      tipId: json['TipId'] as int?,
      paymentId: json['PaymentId'] as int?,
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
      userId: json['UserId'] as int?,
      userName: json['userName'] as String?,
      splitByPercentage: json['SplitByPercentage'] as int?,
      isActive: json['IsActive'] as bool?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      siteId: json['SiteId'] as int?,
      guid: json['Guid'] as String?,
      synchStatus: json['SynchStatus'] as bool?,
      masterEntityId: json['MasterEntityId'] as int?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      isChanged: json['IsChanged'] as bool?,
      shouldRemoveFromBackend:
          json['shouldRemoveFromBackend'] as bool? ?? false,
    );

Map<String, dynamic> _$$_EmployeeTipDataToJson(_$_EmployeeTipData instance) =>
    <String, dynamic>{
      'TipId': instance.tipId,
      'PaymentId': instance.paymentId,
      'tipAmount': instance.tipAmount,
      'UserId': instance.userId,
      'userName': instance.userName,
      'SplitByPercentage': instance.splitByPercentage,
      'IsActive': instance.isActive,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'SiteId': instance.siteId,
      'Guid': instance.guid,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'IsChanged': instance.isChanged,
      'shouldRemoveFromBackend': instance.shouldRemoveFromBackend,
    };
