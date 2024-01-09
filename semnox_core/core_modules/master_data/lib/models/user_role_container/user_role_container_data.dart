// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';

part 'user_role_container_data.freezed.dart';
part 'user_role_container_data.g.dart';

@freezed
class UserRoleContainerData with _$UserRoleContainerData {
  const factory UserRoleContainerData({
    @JsonKey(name: 'UserRoleContainerDTOList')
    required List<UserRoleContainerDTO> userRoleContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _UserRoleContainerData;

  factory UserRoleContainerData.fromJson(Map<String, dynamic> json) => _$UserRoleContainerDataFromJson(json);
}