// To parse this JSON data, do
//
//     final shiftConfigResponseModel = shiftConfigResponseModelFromJson(jsonString);

import 'dart:convert';

ShiftConfigResponseModel shiftConfigResponseModelFromJson(String str) =>
    ShiftConfigResponseModel.fromJson(json.decode(str));

String shiftConfigResponseModelToJson(ShiftConfigResponseModel data) =>
    json.encode(data.toJson());

class ShiftConfigResponseModel {
  Data? data;
  String? exception;

  ShiftConfigResponseModel({
    this.data,
    this.exception
  });

  factory ShiftConfigResponseModel.fromJson(Map<String, dynamic> json) =>
      ShiftConfigResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        exception: json["exception"]
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "exception": exception
      };
}

class Data {
  List<ShiftConfigurationsContainerDtoList>?
      shiftConfigurationsContainerDtoList;
  String? hash;

  Data({
    this.shiftConfigurationsContainerDtoList,
    this.hash,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        shiftConfigurationsContainerDtoList:
            json["ShiftConfigurationsContainerDTOList"] == null
                ? []
                : List<ShiftConfigurationsContainerDtoList>.from(
                    json["ShiftConfigurationsContainerDTOList"]!.map((x) =>
                        ShiftConfigurationsContainerDtoList.fromJson(x))),
        hash: json["Hash"],
      );

  Map<String, dynamic> toJson() => {
        "ShiftConfigurationsContainerDTOList":
            shiftConfigurationsContainerDtoList == null
                ? []
                : List<dynamic>.from(shiftConfigurationsContainerDtoList!
                    .map((x) => x.toJson())),
        "Hash": hash,
      };
}

class ShiftConfigurationsContainerDtoList {
  int? shiftConfigurationId;
  String? shiftConfigurationName;
  int? shiftMinutes;
  int? weeklyShiftMinutes;
  int? graceMinutes;
  bool? shiftTrackAllowed;
  bool? overtimeAllowed;
  int? maximumOvertimeMinutes;
  int? maximumWeeklyOvertimeMinutes;
  bool? isActive;

  ShiftConfigurationsContainerDtoList({
    this.shiftConfigurationId,
    this.shiftConfigurationName,
    this.shiftMinutes,
    this.weeklyShiftMinutes,
    this.graceMinutes,
    this.shiftTrackAllowed,
    this.overtimeAllowed,
    this.maximumOvertimeMinutes,
    this.maximumWeeklyOvertimeMinutes,
    this.isActive,
  });

  factory ShiftConfigurationsContainerDtoList.fromJson(
          Map<String, dynamic> json) =>
      ShiftConfigurationsContainerDtoList(
        shiftConfigurationId: json["ShiftConfigurationId"],
        shiftConfigurationName: json["ShiftConfigurationName"],
        shiftMinutes: json["ShiftMinutes"],
        weeklyShiftMinutes: json["WeeklyShiftMinutes"],
        graceMinutes: json["GraceMinutes"],
        shiftTrackAllowed: json["ShiftTrackAllowed"],
        overtimeAllowed: json["OvertimeAllowed"],
        maximumOvertimeMinutes: json["MaximumOvertimeMinutes"],
        maximumWeeklyOvertimeMinutes: json["MaximumWeeklyOvertimeMinutes"],
        isActive: json["IsActive"],
      );

  Map<String, dynamic> toJson() => {
        "ShiftConfigurationId": shiftConfigurationId,
        "ShiftConfigurationName": shiftConfigurationName,
        "ShiftMinutes": shiftMinutes,
        "WeeklyShiftMinutes": weeklyShiftMinutes,
        "GraceMinutes": graceMinutes,
        "ShiftTrackAllowed": shiftTrackAllowed,
        "OvertimeAllowed": overtimeAllowed,
        "MaximumOvertimeMinutes": maximumOvertimeMinutes,
        "MaximumWeeklyOvertimeMinutes": maximumWeeklyOvertimeMinutes,
        "IsActive": isActive,
      };
}
