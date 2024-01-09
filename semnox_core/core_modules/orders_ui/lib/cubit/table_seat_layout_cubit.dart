import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_ui/cubit/table_seat_layout_state.dart';

class TableSeatCubit extends Cubit<TableSeatCubitState> {

  TableSeatCubit() : super(TableSeatCubitState());

  // rebuild(){
  //   emit(state.copyWith(shouldRebuild: !state.shouldRebuild));
  // }

  changeLoading(bool loadingState) => emit(state.copyWith(isLoading: loadingState));

  selectFacility(int index) => emit(state.copyWith(
    selectedFacilityIndex: index,
    pressedRowOuterValue: -1,
    pressedColumnOuterValue: -1,
  ));

  changeOrderModeOrActionModeButton()=>emit(state.copyWith(
      showOrderModeButton: !state.showOrderModeButton,
      pressedRowOuterValue: -1,
      pressedColumnOuterValue: -1,
  ));

  selectionOfTable({required int tableId,required int rowIndex,required int columnIndex}){
    emit(state.copyWith(
      selectedTableId: tableId,
      pressedRowOuterValue: rowIndex,
      pressedColumnOuterValue: columnIndex,
    ));
  }
  // selectTable(int rowIndex,int columnIndex){
  //   emit(state.copyWith(
  //     pressedRowOuterValue: rowIndex,
  //     pressedColumnOuterValue: columnIndex,
  //   ));
  // }
  rebuildScreen(){
    emit(state.copyWith(
      shouldRefreshFullScreen: !state.shouldRefreshFullScreen,
      pressedColumnOuterValue: -1,
      pressedRowOuterValue: -1,
      showOrderModeButton: true,
    ));
  }

  unSelectTable(){
    emit(state.copyWith(
      pressedColumnOuterValue: -1,
      pressedRowOuterValue: -1,
    ));
  }

  loading({required bool isLoading}){
    emit(state.copyWith(
      isLoading: isLoading,
    ));
  }

}