// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_management_item.freezed.dart';
part 'key_management_item.g.dart';

@freezed
class KeyManagementItem with _$KeyManagementItem {
  const factory KeyManagementItem({
    @JsonKey(name: 'KeyManagementWarningType')
    required String keyManagementWarningType,
    @JsonKey(name: 'MessageNumber')
    required int messageNumber,
    @JsonKey(name: 'Parameters')
    required List<String> parameters,
  }) = _KeyManagementItem;

  factory KeyManagementItem.fromJson(Map<String, dynamic> json) => _$KeyManagementItemFromJson(json);
}
