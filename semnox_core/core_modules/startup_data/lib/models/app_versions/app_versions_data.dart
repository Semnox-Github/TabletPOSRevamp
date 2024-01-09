// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_versions_data.freezed.dart';
part 'app_versions_data.g.dart';

@freezed
class AppVersionsData with _$AppVersionsData {
  const factory AppVersionsData({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'ParafaitExecutableName')
    required String parafaitExecutableName,
    @JsonKey(name: 'MajorVersion')
    required int majorVersion,
    @JsonKey(name: 'MinorVersion')
    required int minorVersion,
    @JsonKey(name: 'PatchVersion')
    required int patchVersion,
    @JsonKey(name: 'ExecutableGeneratedAt')
    required String executableGeneratedAt,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'LastupdatedDate')
    required String lastupdatedDate,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) = _AppVersionsData;

  factory AppVersionsData.fromJson(Map<String, dynamic> json) => _$AppVersionsDataFromJson(json);
}
