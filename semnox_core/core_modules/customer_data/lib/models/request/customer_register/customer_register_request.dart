// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:customer_data/models/profile_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'customer_register_request.freezed.dart';
part 'customer_register_request.g.dart';

@freezed
class CustomerRegisterRequest with _$CustomerRegisterRequest {

  const factory CustomerRegisterRequest({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'ProfileId')
    required int profileId,
    @JsonKey(name: 'MembershipId')
    required int membershipId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'ExternalSystemReference')
    String? externalSystemReference,
    @JsonKey(name: 'Channel')
    String? channel,
    @JsonKey(name: 'profileDTO')
    required ProfileDTO profileDTO,
  }) =_CustomerRegisterRequest;

  factory CustomerRegisterRequest.fromJson(Map<String, Object?> json) =>
      _$CustomerRegisterRequestFromJson(json);
}
