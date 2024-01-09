// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_account_dto.freezed.dart';
part 'transaction_account_dto.g.dart';

@freezed
class TransactionAccountDto with _$TransactionAccountDto {
  const factory TransactionAccountDto({
    @JsonKey(name: 'TransactionAccountId')
    int? transactionAccountId,
    @JsonKey(name: 'TransactionId')
    int? transactionId,
    @JsonKey(name: 'TransactionLineId')
    int? transactionLineId,
    @JsonKey(name: 'AccountId')
    int? accountId,
    @JsonKey(name: 'TagNumber')
    required String tagNumber,
    @JsonKey(name: 'SerialNumber')
    String? serialNumber,
    @JsonKey(name: 'ExistingAccount')
    required bool existingAccount,
    @JsonKey(name: 'IsActive')
    required bool isActive,
  }) = _TransactionAccountDto;

  factory TransactionAccountDto.fromJson(Map<String, dynamic> json) => _$TransactionAccountDtoFromJson(json);
}
