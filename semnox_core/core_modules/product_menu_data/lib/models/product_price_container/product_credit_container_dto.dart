// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';



part 'product_credit_container_dto.freezed.dart';
part 'product_credit_container_dto.g.dart';

@freezed
class ProductCreditPlusContainerDTO with _$ProductCreditPlusContainerDTO {
  const factory ProductCreditPlusContainerDTO({
    @JsonKey(name: 'ProductCreditPlusId')
    required int productCreditPlusId,
    @JsonKey(name: 'CreditPlus')
    required double creditPlus,
    @JsonKey(name: 'Refundable')
    required bool refundable,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'Product_id')
    required int productId,
    @JsonKey(name: 'CreditPlusType')
    required String creditPlusType,
    @JsonKey(name: 'Guid')
    dynamic guid,
    @JsonKey(name: 'PeriodFrom')
    required String periodFrom,
    @JsonKey(name: 'PeriodTo')
    required String periodTo,
    @JsonKey(name: 'ValidForDays')
    required int validForDays,
    @JsonKey(name: 'ExtendOnReload')
    required bool extendOnReload,
    @JsonKey(name: 'TimeFrom')
    dynamic timeFrom,
    @JsonKey(name: 'TimeTo')
    dynamic timeTo,
    @JsonKey(name: 'Minutes')
    required int minutes,
    @JsonKey(name: 'Monday')
    required bool monday,
    @JsonKey(name: 'Tuesday')
    required bool tuesday,
    @JsonKey(name: 'Wednesday')
    required bool wednesday,
    @JsonKey(name: 'Thursday')
    required bool thursday,
    @JsonKey(name: 'Friday')
    required bool friday,
    @JsonKey(name: 'Saturday')
    required bool saturday,
    @JsonKey(name: 'Sunday')
    required bool sunday,
    @JsonKey(name: 'TicketAllowed')
    required bool ticketAllowed,
    @JsonKey(name: 'Frequency')
    required String frequency,
    @JsonKey(name: 'PauseAllowed')
    required bool pauseAllowed,
    @JsonKey(name: 'CreditPlusConsumptionRulesContainerDTOList')
    required List<dynamic> creditPlusConsumptionRulesContainerDTOList,
    @JsonKey(name: 'EntityOverrideDateContainerDTOList')
    required List<dynamic> entityOverrideDateContainerDTOList,
    @JsonKey(name: 'EffectiveAfterMinutes')
    required int effectiveAfterMinutes,
  }) = _ProductCreditPlusContainerDTO;

  factory ProductCreditPlusContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductCreditPlusContainerDTOFromJson(json);
}
