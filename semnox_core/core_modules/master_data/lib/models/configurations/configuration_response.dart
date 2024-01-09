
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/configurations/configuration_data.dart';

part 'configuration_response.freezed.dart';
part 'configuration_response.g.dart';

@freezed
class ConfigurationResponse with _$ConfigurationResponse {
  const factory ConfigurationResponse({
    ConfigurationData? data,
    String? exception
  }) = _ConfigurationResponse;

  factory ConfigurationResponse.fromJson(Map<String, dynamic> json) => _$ConfigurationResponseFromJson(json);
}