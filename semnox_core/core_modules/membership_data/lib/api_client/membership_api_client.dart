import 'package:dio/dio.dart';
import 'package:membership_data/models/membership_response.dart';
import 'package:retrofit/http.dart';


part 'membership_api_client.g.dart';

@RestApi()
abstract class MemberShipApiClient {

  factory MemberShipApiClient(Dio dio, {String baseUrl}) = _MemberShipApiClient;

  static const membershipEndPoint = "api/Customer/Membership/MembershipsContainer";

  @GET(membershipEndPoint)
  Future<MemberShipResponse> getMembershipData(@Queries() Map<String, dynamic> queries);
}
