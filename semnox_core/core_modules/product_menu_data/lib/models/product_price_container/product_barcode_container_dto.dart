// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';



part 'product_barcode_container_dto.freezed.dart';
part 'product_barcode_container_dto.g.dart';

@freezed
class ProductBarcodeContainerDTO with _$ProductBarcodeContainerDTO {
  const factory ProductBarcodeContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'BarCode')
    required String barCode,
  }) = _ProductBarcodeContainerDTO;

  factory ProductBarcodeContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductBarcodeContainerDTOFromJson(json);
}
