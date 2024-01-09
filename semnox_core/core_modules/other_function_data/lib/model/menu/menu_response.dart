import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_data.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    List<MenuDto>? data,
    String? exception
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}