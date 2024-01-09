import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_orders_cubit_state.dart';
class AllOrdersCubit extends Cubit<AllOrdersCubitState> {

  AllOrdersCubit() : super(AllOrdersCubitState());

  rebuild(){
    emit(state.copyWith(shouldRebuild: !state.shouldRebuild));
  }
}