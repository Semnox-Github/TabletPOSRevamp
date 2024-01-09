// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:membership_data/models/membership_container_dto.dart';

part 'membership_data.freezed.dart';
part 'membership_data.g.dart';

@freezed
class MemberShipData with _$MemberShipData {
  const factory MemberShipData({
    @JsonKey(name: 'MembershipContainerDTOList')
    required List<MembershipContainerDTO> membershipContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _MemberShipData;

  factory MemberShipData.fromJson(Map<String, dynamic> json) => _$MemberShipDataFromJson(json);
}