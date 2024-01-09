import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_response.freezed.dart';
part 'generic_response.g.dart';

@freezed
class GenericResponse with _$GenericResponse {
  const factory GenericResponse({
    dynamic data,
  }) = _GenericResponse;

  factory GenericResponse.fromJson(Map<String, dynamic> json) => _$GenericResponseFromJson(json);
}
