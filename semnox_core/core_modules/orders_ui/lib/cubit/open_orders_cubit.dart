import 'package:flutter_bloc/flutter_bloc.dart';

import 'open_orders_cubit_state.dart';

class OpenOrdersCubit extends Cubit<OpenOrdersCubitState> {

  OpenOrdersCubit() : super(OpenOrdersCubitState());

  rebuild(){
    emit(state.copyWith(shouldRebuild: !state.shouldRebuild));
  }
}