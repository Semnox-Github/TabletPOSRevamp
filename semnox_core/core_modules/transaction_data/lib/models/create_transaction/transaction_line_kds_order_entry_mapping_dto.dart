// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';

part 'transaction_line_kds_order_entry_mapping_dto.freezed.dart';
part 'transaction_line_kds_order_entry_mapping_dto.g.dart';

@freezed
class TransactionLineKDSOrderEntryMappingDTO with _$TransactionLineKDSOrderEntryMappingDTO {
  const factory TransactionLineKDSOrderEntryMappingDTO({
    @JsonKey(name: 'Id')
    int? id,
    @JsonKey(name: 'TransactionId')
    int? transactionId,
    @JsonKey(name: 'TransactionLineId')
    int? transactionLineId,
    @JsonKey(name: 'KDSOrderEntryId')
    int? kdsOrderEntryId,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
  }) = _TransactionLineKDSOrderEntryMappingDTO;

  factory TransactionLineKDSOrderEntryMappingDTO.fromJson(Map<String, dynamic> json) => _$TransactionLineKDSOrderEntryMappingDTOFromJson(json);
}