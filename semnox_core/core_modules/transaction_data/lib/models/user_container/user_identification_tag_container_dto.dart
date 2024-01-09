import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_identification_tag_container_dto.freezed.dart';
part 'user_identification_tag_container_dto.g.dart';

@freezed
class UserIdentificationTagContainerDTO with _$UserIdentificationTagContainerDTO {
  const factory UserIdentificationTagContainerDTO({
    @JsonKey(name: 'Id')
    int? id,
    @JsonKey(name: 'CardNumber')
    String? cardNumber,
    @JsonKey(name: 'CardId')
    int? cardId,
    @JsonKey(name: 'StartDate')
    String? startDate,
    @JsonKey(name: 'EndDate')
    String? endDate,
    @JsonKey(name: 'AttendanceReaderTag')
    bool? attendanceReaderTag

  }) = _UserIdentificationTagContainerDTO;

  factory UserIdentificationTagContainerDTO.fromJson(Map<String, dynamic> json) => _$UserIdentificationTagContainerDTOFromJson(json);
}