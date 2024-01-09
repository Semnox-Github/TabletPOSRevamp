import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_relationship_dto_list.freezed.dart';
part 'account_relationship_dto_list.g.dart';

@freezed
class AccountRelationshipDTOList with _$AccountRelationshipDTOList {
  const factory AccountRelationshipDTOList({
    @JsonKey(name: 'AccountRelationshipId') int? accountRelationId,
    @JsonKey(name: 'AccountId') int? accountId,
    @JsonKey(name: 'RelatedAccountId') int? relatedAccountId,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreationDate') String? creationDate,
    @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate') String? lastUpdateDate,
    @JsonKey(name: 'SiteId') int? siteId,
    @JsonKey(name: 'MasterEntityId') int? masterEntityId,
    @JsonKey(name: 'SynchStatus') bool? synchStatus,
    @JsonKey(name: 'Guid') String? guid,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsChanged') bool? isChanged,
    @JsonKey(name: 'DailyLimitPercentage') int? dailyLimitPercentage,
  }) = _AccountRelationshipDTOList;

  factory AccountRelationshipDTOList.fromJson(Map<String, dynamic> json) =>
      _$AccountRelationshipDTOListFromJson(json);
}
