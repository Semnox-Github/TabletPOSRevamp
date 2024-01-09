
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_status_container_dto.freezed.dart';
part 'transaction_status_container_dto.g.dart';

@freezed
class TransactionStatusContainerDTO with _$TransactionStatusContainerDTO{
  const factory TransactionStatusContainerDTO({
    @JsonKey(name: 'TransactionStatusId')
    required int transactionStatusId,
    @JsonKey(name: 'ThreshHoldTimeOne')
    dynamic? threshHoldTimeOne,
    @JsonKey(name: 'ThreshHoldTimeTwo')
    dynamic? threshHoldTimeTwo,
    @JsonKey(name: 'ThreshHoldTimeThree')
    dynamic? threshHoldTimeThree,
    @JsonKey(name: 'ThreshHoldAlertColorOne')
    String? threshHoldAlertColorOne,
    @JsonKey(name: 'ThreshHoldAlertColorTwo')
    String? threshHoldAlertColorTwo,
    @JsonKey(name: 'ThreshHoldAlertColorThree')
    String? threshHoldAlertColorThree,
    @JsonKey(name: 'StatusCode')
    required String statusCode,
    @JsonKey(name: 'StatusDescription')
    required String statusDescription,
    @JsonKey(name: 'TrackTime')
    required bool trackTime,
    @JsonKey(name: 'ThreshHoldCharacterOne')
    required String threshHoldCharacterOne,
    @JsonKey(name: 'ThreshHoldCharacterTwo')
    required String threshHoldCharacterTwo,
    @JsonKey(name: 'ThreshHoldCharacterThree')
    required String threshHoldCharacterThree,
    @JsonKey(name: 'Color')
    required String color,
    @JsonKey(name: 'Character')
    required String character,
    @JsonKey(name: 'Guid')
    required String guid,
  }) = _TransactionStatusContainerDTO;

  factory TransactionStatusContainerDTO.fromJson(Map<String, dynamic> json) => _$TransactionStatusContainerDTOFromJson(json);
}