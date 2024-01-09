import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_panels_data.dart';

part 'menu_panels_response.freezed.dart';
part 'menu_panels_response.g.dart';

@freezed
class MenuPanelsResponse with _$MenuPanelsResponse {
  const factory MenuPanelsResponse({
    List<MenuPanelsDto>? data,
    String? exception
  }) = _MenuPanelsResponse;

  factory MenuPanelsResponse.fromJson(Map<String, dynamic> json) => _$MenuPanelsResponseFromJson(json);
}