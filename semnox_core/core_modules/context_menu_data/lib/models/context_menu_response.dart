import 'package:context_menu_data/models/context_menu_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'context_menu_response.freezed.dart';
part 'context_menu_response.g.dart';

@freezed
class ContextMenuResponse with _$ContextMenuResponse {
  const factory ContextMenuResponse({
    ContextMenuData? data,
    String? exception
  }) = _ContextMenuResponse;

  factory ContextMenuResponse.fromJson(Map<String, dynamic> json) => _$ContextMenuResponseFromJson(json);
}