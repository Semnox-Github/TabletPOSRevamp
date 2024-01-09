// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_container_dto.dart';

part 'transaction_profile_data.freezed.dart';
part 'transaction_profile_data.g.dart';

@freezed
class TransactionProfileData with _$TransactionProfileData {
  const factory TransactionProfileData({
    @JsonKey(name: 'TransactionProfileContainerDTOList')
    required List<TransactionProfileContainerDTO> transactionProfileContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _TransactionProfileData;

  factory TransactionProfileData.fromJson(Map<String, dynamic> json) => _$TransactionProfileDataFromJson(json);
}