
import 'package:freezed_annotation/freezed_annotation.dart';


part 'transaction_discount_dto.freezed.dart';
part 'transaction_discount_dto.g.dart';

@freezed
class TransactionDiscountDTO with _$TransactionDiscountDTO{
  const factory TransactionDiscountDTO({
    @JsonKey(name: 'TransactionId')
    dynamic? transactionId,
  }) = _TransactionDiscountDTO;

  factory TransactionDiscountDTO.fromJson(Map<String, dynamic> json) => _$TransactionDiscountDTOFromJson(json);

}