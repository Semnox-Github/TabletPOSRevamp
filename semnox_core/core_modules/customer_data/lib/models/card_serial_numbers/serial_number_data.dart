// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'serial_number_data.freezed.dart';

part 'serial_number_data.g.dart';

@freezed
class CardSerialNumberData with _$CardSerialNumberData {
  const factory CardSerialNumberData({
    @JsonKey(name: 'TagSerialMappingId') int? tagSerialMappingId,
    @JsonKey(name: 'SerialNumber') String? serialNumber,
    @JsonKey(name: 'TagNumber') String? tagNumber,
    @JsonKey(name: 'Issued') bool? issued,
    @JsonKey(name: 'CreationDate') String? creationDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'SiteId') int? siteId,
    @JsonKey(name: 'MasterEntityId') int? masterEntityId,
    @JsonKey(name: 'SynchStatus') bool? synchStatus,
    @JsonKey(name: 'Guid') String? guid,
    @JsonKey(name: 'Status') dynamic status,
    @JsonKey(name: 'Message') dynamic message,
    @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate') String? lastUpdateDate,
    @JsonKey(name: 'IsChanged') bool? isChanged,
  }) = _CardSerialNumberData;

  factory CardSerialNumberData.fromJson(Map<String, dynamic> json) =>
      _$CardSerialNumberDataFromJson(json);
}
