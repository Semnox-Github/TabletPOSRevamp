
import 'package:freezed_annotation/freezed_annotation.dart';
part 'table_seat_layout_state.freezed.dart';
part 'table_seat_layout_state.g.dart';

@freezed
class TableSeatCubitState with _$TableSeatCubitState {

  const factory TableSeatCubitState({
    @Default(false) bool shouldRefreshFullScreen,
    @Default(false) bool isLoading,
    @Default(-1) int selectedFacilityIndex,
    @Default(true) bool showOrderModeButton,
    @Default(-1) int pressedRowOuterValue,
    @Default(-1) int pressedColumnOuterValue,
    @Default(-1) int selectedTableId,


  }) = _TableSeatCubitState;

  factory TableSeatCubitState.fromJson(Map<String, dynamic> json) => _$TableSeatCubitStateFromJson(json);
}
