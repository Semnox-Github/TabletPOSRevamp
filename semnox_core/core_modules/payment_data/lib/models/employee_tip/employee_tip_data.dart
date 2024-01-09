// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_tip_data.freezed.dart';
part 'employee_tip_data.g.dart';

@freezed
class EmployeeTipData with _$EmployeeTipData {
  const factory EmployeeTipData({
    @JsonKey(name: 'TipId')
    int? tipId,
    @JsonKey(name: 'PaymentId')
    int? paymentId,
    double? tipAmount,
    @JsonKey(name: 'UserId')
    int? userId,
    String? userName,
    @JsonKey(name: 'SplitByPercentage')
    int? splitByPercentage,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @Default(false)
    bool shouldRemoveFromBackend
  }) = _EmployeeTipData;

  factory EmployeeTipData.fromJson(Map<String, dynamic> json) => _$EmployeeTipDataFromJson(json);
}