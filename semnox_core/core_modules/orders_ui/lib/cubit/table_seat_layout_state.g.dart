// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_seat_layout_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableSeatCubitStateImpl _$$TableSeatCubitStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TableSeatCubitStateImpl(
      shouldRefreshFullScreen:
          json['shouldRefreshFullScreen'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      selectedFacilityIndex: json['selectedFacilityIndex'] as int? ?? -1,
      showOrderModeButton: json['showOrderModeButton'] as bool? ?? true,
      pressedRowOuterValue: json['pressedRowOuterValue'] as int? ?? -1,
      pressedColumnOuterValue: json['pressedColumnOuterValue'] as int? ?? -1,
      selectedTableId: json['selectedTableId'] as int? ?? -1,
    );

Map<String, dynamic> _$$TableSeatCubitStateImplToJson(
        _$TableSeatCubitStateImpl instance) =>
    <String, dynamic>{
      'shouldRefreshFullScreen': instance.shouldRefreshFullScreen,
      'isLoading': instance.isLoading,
      'selectedFacilityIndex': instance.selectedFacilityIndex,
      'showOrderModeButton': instance.showOrderModeButton,
      'pressedRowOuterValue': instance.pressedRowOuterValue,
      'pressedColumnOuterValue': instance.pressedColumnOuterValue,
      'selectedTableId': instance.selectedTableId,
    };
