import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/user_container/user_container_data.dart';

part 'user_container_response.freezed.dart';
part 'user_container_response.g.dart';

@freezed
class UserContainerResponse with _$UserContainerResponse {
  const factory UserContainerResponse({
    UserContainerData? data,
    String? exception
  }) = _UserContainerResponse;

  factory UserContainerResponse.fromJson(Map<String, dynamic> json) => _$UserContainerResponseFromJson(json);
}