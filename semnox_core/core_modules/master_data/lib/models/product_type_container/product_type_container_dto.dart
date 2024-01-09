import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_type_container_dto.freezed.dart';
part 'product_type_container_dto.g.dart';

@freezed
class ProductTypeContainerDto with _$ProductTypeContainerDto{
  const factory ProductTypeContainerDto({
    @JsonKey(name: 'ProductTypeId')
    int? productTypeId,
    @JsonKey(name: 'ProductType')
    String? productType,
    @JsonKey(name: 'Description')
    String? description,
    @JsonKey(name: 'CardSale')
    bool? cardSale,
    @JsonKey(name: 'ReportGroup')
    String? reportGroup,
    @JsonKey(name: 'OrderTypeId')
    int? orderTypeId,
  }) = _ProductTypeContainerDto;

  factory ProductTypeContainerDto.fromJson(Map<String, dynamic> json) => _$ProductTypeContainerDtoFromJson(json);
}