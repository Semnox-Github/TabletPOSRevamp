import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:startup_data/models/app_versions/app_versions_response.dart';
import 'package:startup_data/models/generic/generic_response.dart';
import 'package:startup_data/models/remote_connection/remote_connection_response.dart';

part 'startup_data_api_client.g.dart';

@RestApi()
abstract class StartupDataApiClient {

  factory StartupDataApiClient(Dio dio, {String baseUrl}) = _StartupDataApiClient;

  static const _remoteConnectionEndPoint = "api/Common/RemoteConnectionCheck";
  static const _versionCheckEndPoint = "api/Configuration/VersionCheck";
  static const _validateLicenseEndPoint = "api/Configuration/ValidateLicense";
  static const _validatePosMachineEndPoint = "api/Configuration/ValidatePosMachine";
  static const _validateMaxCardEndPoint = "api/Customer/Account/ValidateMaxCard";
  static const _validateTransactionNumEndPoint = "api/Transaction/ValidateTransactionNumber";
  static const _checkAppVersionsEndPoint = "api/Configuration/ParafaitVersions";

  @GET(_remoteConnectionEndPoint)
  Future<RemoteConnectionResponse> checkRemoteServerStatus();

  @GET(_versionCheckEndPoint)
  Future<GenericResponse> checkVersion(@Queries() Map<String, dynamic> queries);

  @GET(_validateLicenseEndPoint)
  Future<GenericResponse> validateLicense();

  @GET(_validatePosMachineEndPoint)
  Future<GenericResponse> validatePosMachineCount(@Queries() Map<String, dynamic> queries);

  @GET(_validateMaxCardEndPoint)
  Future<GenericResponse> validateMaxCard();

  @GET(_validateTransactionNumEndPoint)
  Future<GenericResponse> validateTransactionNumber();

  @GET(_checkAppVersionsEndPoint)
  Future<AppVersionsResponse> checkAppVersions();
}
