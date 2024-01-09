import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_line_dto.freezed.dart';
part 'receipt_line_dto.g.dart';

@freezed
class ReceiptLineDto with _$ReceiptLineDto {
  const factory ReceiptLineDto({
    @JsonKey(name: 'TemplateSection') required String templateSection,
    @JsonKey(name: 'Data') required List<String?>? data,
    @JsonKey(name: 'Alignments') required List<String?>? alignments,
    @JsonKey(name: 'ColumnCount') required int columnCount,
    @JsonKey(name: 'Font') required String? font,
    @JsonKey(name: 'BarCode') required String? barCode,
    @JsonKey(name: 'LineId') required int lineId,
    @JsonKey(name: 'LineHeight') required int lineHeight,
    @JsonKey(name: 'StrikeThrough') required bool? strikeThrough,
    @JsonKey(name: 'PrintAttributeType') required String printAttributeType,
  }) = _ReceiptLineDto;

  factory ReceiptLineDto.fromJson(Map<String, dynamic> json) => _$ReceiptLineDtoFromJson(json);
}