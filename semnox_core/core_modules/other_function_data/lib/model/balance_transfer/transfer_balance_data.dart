import 'package:freezed_annotation/freezed_annotation.dart';
part 'transfer_balance_data.freezed.dart';
part 'transfer_balance_data.g.dart';

@freezed
class TransferBalanceData with _$TransferBalanceData {
  const factory TransferBalanceData({
    @JsonKey(name: 'SourceAccountId')
    int? sourceAccountId,
    @JsonKey(name: 'DestinationAccountId')
    int? destinationAccountId,
    @JsonKey(name: 'ValueLoaded')
    double? valueLoaded,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'ActivityDate')
    String? activityDate,
    @JsonKey(name: 'SourceAccountNumber')
    String? sourceAccountNumber,
    @JsonKey(name: 'DestinationAccountNumber')
    String? destinationAccountNumber,
    @JsonKey(name: 'POSMachineId')
    int? pOSMachineId,
    @JsonKey(name: 'UserId')
    int? userId,
    @JsonKey(name: 'ApprovedBy')
    String? approvedBy,
    @JsonKey(name: 'ApprovalDate')
    String? approvalDate,
    @JsonKey(name: 'EntitlementType')
    String? entitlementType,
  }) = _TransferBalanceData;

  factory TransferBalanceData.fromJson(Map<String, dynamic> json) =>
      _$TransferBalanceDataFromJson(json);
}
