// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_account_dto.freezed.dart';

part 'transaction_account_dto.g.dart';

@freezed
class TransactionLineAccountDto with _$TransactionLineAccountDto {
  const factory TransactionLineAccountDto({
    @JsonKey(name: 'TransactionAccountId') int? transactionAccountId,
    @JsonKey(name: 'TransactionId') int? transactionId,
    @JsonKey(name: 'TransactionLineId') int? transactionLineId,
    @JsonKey(name: 'AccountId') int? accountId,
    @JsonKey(name: 'TagNumber') String? tagNumber,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'ExistingAccount') bool? existingAccount,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreationDate') String? creationDate,
    @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate') String? lastUpdatedDate,
    @JsonKey(name: 'Guid') String? guid,
    @JsonKey(name: 'SiteId') int? siteId,
    @JsonKey(name: 'SynchStatus') bool? synchStatus,
    @JsonKey(name: 'MasterEntityId') int? masterEntityId,
    @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
        List<dynamic>? transactionLineAccountDiscountMappingDTOList,
    @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
        List<dynamic>? transactionLineAccountGameMappingDTOList,
    @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
        List<dynamic>? transactionLineAccountCreditPlusMappingDTOList,
    @JsonKey(name: 'IsChanged') bool? isChanged,
    @JsonKey(name: 'IsChangedRecursive') bool? isChangedRecursive,
  }) = _TransactionLineAccountDto;

  factory TransactionLineAccountDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionLineAccountDtoFromJson(json);
}
