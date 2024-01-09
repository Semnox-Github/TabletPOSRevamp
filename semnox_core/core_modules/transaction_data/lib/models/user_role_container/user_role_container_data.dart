import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/user_role_container/user_role_container_dto.dart';

part 'user_role_container_data.freezed.dart';
part 'user_role_container_data.g.dart';

@freezed
class UserRoleContanierData with _$UserRoleContanierData {
  const factory UserRoleContanierData({
    @JsonKey(name: 'UserRoleContainerDTOList')
    required List<UserRoleContanierDTO> userRoleContainerDtoList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _UserRoleContanierData;

  factory UserRoleContanierData.fromJson(Map<String, dynamic> json) => _$UserRoleContanierDataFromJson(json);
}