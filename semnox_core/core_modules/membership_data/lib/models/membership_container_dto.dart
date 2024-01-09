// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership_container_dto.freezed.dart';
part 'membership_container_dto.g.dart';

@freezed
class MembershipContainerDTO with _$MembershipContainerDTO {
  const factory MembershipContainerDTO({
    @JsonKey(name: 'MembershipId')
    required int membershipId,
    @JsonKey(name: 'MembershipName')
    required String membershipName,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'RedemptionDiscount')
    required double redemptionDiscount,
    @JsonKey(name: 'PriceListId')
    required int priceListId,
  }) = _MembershipContainerDTO;

  factory MembershipContainerDTO.fromJson(Map<String, dynamic> json) => _$MembershipContainerDTOFromJson(json);
}