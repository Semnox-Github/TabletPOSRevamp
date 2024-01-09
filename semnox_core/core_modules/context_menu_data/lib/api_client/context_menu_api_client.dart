import 'package:context_menu_data/models/context_menu_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'context_menu_api_client.g.dart';

@RestApi()
abstract class ContextMenuApiClient {

  factory ContextMenuApiClient(Dio dio, {String baseUrl}) = _ContextMenuApiClient;

  static const typesEndPoint = "api/Transaction/TaskTypesContainer";

  @GET(typesEndPoint)
  Future<ContextMenuResponse> getContextMenus(@Queries() Map<String, dynamic> queries);
}
