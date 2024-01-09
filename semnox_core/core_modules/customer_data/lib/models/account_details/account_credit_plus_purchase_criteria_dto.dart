import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_credit_plus_purchase_criteria_dto.freezed.dart';
part 'account_credit_plus_purchase_criteria_dto.g.dart';

@freezed
class AccountCreditPlusPurchaseCriteriaDTO with _$AccountCreditPlusPurchaseCriteriaDTO{
  const factory AccountCreditPlusPurchaseCriteriaDTO({
    @JsonKey(name: 'ProductId')
    required int? productId,
  }) = _AccountCreditPlusPurchaseCriteriaDTO;

  factory AccountCreditPlusPurchaseCriteriaDTO.fromJson(Map<String, dynamic> json) => _$AccountCreditPlusPurchaseCriteriaDTOFromJson(json);
}