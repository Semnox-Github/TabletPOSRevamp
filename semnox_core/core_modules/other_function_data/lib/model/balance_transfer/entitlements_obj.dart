// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'entitlements_obj.freezed.dart';
part 'entitlements_obj.g.dart';

@freezed
class Entitlements with _$Entitlements {
  const factory Entitlements({
    @JsonKey(name: 'BONUS')
    double? bONUS,
    @JsonKey(name: 'CREDITS')
    double? cREDITS,
    @JsonKey(name: 'TICKETS')
    double? tICKETS,
    @JsonKey(name: 'COURTESY')
    double? cOURTESY,
    @JsonKey(name: 'TIME')
    double? tIME,
    @JsonKey(name: 'PLAYCREDITS')
    double? pLAYCREDITS,
    @JsonKey(name: 'COUNTERITEMS')
    double? cOUNTERITEMS,
  }) = _Entitlements;

  factory Entitlements.fromJson(Map<String, dynamic> json) => _$EntitlementsFromJson(json);
}
