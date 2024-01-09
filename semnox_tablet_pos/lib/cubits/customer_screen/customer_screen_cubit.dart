import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_screen_state.dart';

class CustomerScreenCubit extends Cubit<CustomerScreenState>{
  CustomerScreenCubit(): super(CustomerScreenState()); // here inside Balance_transfer class,  some of the fields are already initialized

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