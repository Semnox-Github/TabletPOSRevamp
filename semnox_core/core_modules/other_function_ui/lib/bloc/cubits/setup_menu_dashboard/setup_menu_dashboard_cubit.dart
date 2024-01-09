import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_ui/bloc/cubits/setup_menu_dashboard/setup_menu_dashboard_state.dart';

class SetUpMenuDashBoardCubit extends Cubit<SetUpMenuDashBoardState>{
  SetUpMenuDashBoardCubit(): super(SetUpMenuDashBoardState()); // here inside Balance_transfer class,  some of the fields are already initialized

void initState({required String initialSelectedTab, required bool isShowSideBar}){
  emit(state.copyWith(
      selectedButtonValue : initialSelectedTab,
    showSideBar: isShowSideBar
  ));
}

  void changeSideBar(){
    emit(state.copyWith(
        showSideBar : state.showSideBar? false:true
    ));
  }

  void changeTab(newState){
    emit(state.copyWith(
        selectedButtonValue : newState
    ));
  }
}