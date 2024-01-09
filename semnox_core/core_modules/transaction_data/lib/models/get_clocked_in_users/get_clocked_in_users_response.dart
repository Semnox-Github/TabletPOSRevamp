import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/get_clocked_in_users/get_clocked_in_users_data.dart';

part 'get_clocked_in_users_response.freezed.dart';
part 'get_clocked_in_users_response.g.dart';

@freezed
class GetClockedInUsersResponse with _$GetClockedInUsersResponse {
  const factory GetClockedInUsersResponse({
    List<GetClockedInUsersData>? data,
    String? exception
  }) = _GetClockedInUsersResponse;

  factory GetClockedInUsersResponse.fromJson(Map<String, dynamic> json) => _$GetClockedInUsersResponseFromJson(json);
}