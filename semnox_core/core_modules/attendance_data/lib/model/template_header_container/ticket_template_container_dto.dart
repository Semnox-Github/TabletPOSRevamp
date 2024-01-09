// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'ticket_template_container_dto.freezed.dart';
part 'ticket_template_container_dto.g.dart';

@freezed
class TicketTemplateContainerDTO with _$TicketTemplateContainerDTO {
  const factory TicketTemplateContainerDTO({
    @JsonKey(name: 'ID')
    required int id,
    @JsonKey(name: 'TemplateId')
    required int templateId,
    @JsonKey(name: 'Width')
    required double width,
    @JsonKey(name: 'Height')
    required double height,
    @JsonKey(name: 'LeftMargin')
    required int leftMargin,
    @JsonKey(name: 'RightMargin')
    required int rightMargin,
    @JsonKey(name: 'TopMargin')
    required int topMargin,
    @JsonKey(name: 'BottomMargin')
    required int bottomMargin,
    @JsonKey(name: 'BorderWidth')
    required int borderWidth,
    @JsonKey(name: 'BackgroundImage')
    dynamic backgroundImage,
    @JsonKey(name: 'BacksideTemplateId')
    dynamic backsideTemplateId,
    @JsonKey(name: 'GUID')
    required String guid,
  }) = _TicketTemplateContainerDTO;

  factory TicketTemplateContainerDTO.fromJson(Map<String, dynamic> json) => _$TicketTemplateContainerDTOFromJson(json);
}