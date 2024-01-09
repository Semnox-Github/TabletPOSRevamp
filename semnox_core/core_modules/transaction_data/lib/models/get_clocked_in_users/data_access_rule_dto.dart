import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_access_rule_dto.freezed.dart';
part 'data_access_rule_dto.g.dart';

@freezed
class DataAccessRuleDto with _$DataAccessRuleDto {
  const factory DataAccessRuleDto({
    @JsonKey(name: 'DataAccessRuleId') required int dataAccessRuleId,
    @JsonKey(name: 'Name') required dynamic name,
    @JsonKey(name: 'IsActive') required bool isActive,
    @JsonKey(name: 'CreatedBy') required String? createdBy,
    @JsonKey(name: 'CreationDate') required String? creationDate,
    @JsonKey(name: 'LastUpdatedBy') required String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate') required String lastUpdatedDate,
    @JsonKey(name: 'Guid') required dynamic guid,
    @JsonKey(name: 'SiteId') required int siteId,
    @JsonKey(name: 'SynchStatus') required bool synchStatus,
    @JsonKey(name: 'MasterEntityId') required int masterEntityId,
    @JsonKey(name: 'DataAccessDetailDTOList') required dynamic dataAccessDetailDtoList,
    @JsonKey(name: 'IsChangedRecursive') required bool isChangedRecursive,
    @JsonKey(name: 'IsChanged') required bool isChanged,
  }) = _DataAccessRuleDto;

  factory DataAccessRuleDto.fromJson(Map<String, dynamic> json) =>
      _$DataAccessRuleDtoFromJson(json);
}
