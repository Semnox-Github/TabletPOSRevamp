import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/user_role_container/user_role_container_data.dart';

part 'user_role_container_response.freezed.dart';
part 'user_role_container_response.g.dart';

@freezed
class UserRoleContainerResponse with _$UserRoleContainerResponse {
  const factory UserRoleContainerResponse({
    UserRoleContanierData? data,
    String? exception
  }) = _UserRoleContainerResponse;

  factory UserRoleContainerResponse.fromJson(Map<String, dynamic> json) => _$UserRoleContainerResponseFromJson(json);
}