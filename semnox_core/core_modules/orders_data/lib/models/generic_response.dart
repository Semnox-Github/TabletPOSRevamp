import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'generic_response.freezed.dart';
part 'generic_response.g.dart';



@freezed
 class GenericResponse<T> with _$GenericResponse<T> {
  const factory GenericResponse({
    dynamic data,
    String? exception,
    String? message,
  }) = _GenericResponse<T>;
  factory GenericResponse.fromJson(Map<String, dynamic> json) =>_$GenericResponseFromJson(json);
}