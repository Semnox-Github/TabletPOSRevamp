// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_menu_container_snapshot_dto.dart';
import 'package:product_menu_data/models/product_menu_data.dart';

part 'product_menu_response.freezed.dart';
part 'product_menu_response.g.dart';

@freezed
class ProductMenuResponse with _$ProductMenuResponse {

  const factory ProductMenuResponse({
    ProductMenuData? data,
    String? exception
  }) = _ProductMenuResponse;

  factory ProductMenuResponse.fromJson(Map<String, Object?> json) =>
      _$ProductMenuResponseFromJson(json);
}