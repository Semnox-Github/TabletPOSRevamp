// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'entitlements_obj.dart';
part 'transfer_details_dto.freezed.dart';
part 'transfer_details_dto.g.dart';

@freezed
class TransferDetailsDto with _$TransferDetailsDto {
  const factory TransferDetailsDto({
    @JsonKey(name: 'CardId')
    int? cardId,
    @JsonKey(name: 'Entitlements')
    Entitlements? entitlements,

  }) = _TransferDetailsDto;

  factory TransferDetailsDto.fromJson(Map<String, dynamic> json) => _$TransferDetailsDtoFromJson(json);
}
