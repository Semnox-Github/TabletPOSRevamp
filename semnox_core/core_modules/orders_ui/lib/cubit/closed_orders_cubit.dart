import 'package:flutter_bloc/flutter_bloc.dart';

import 'closed_orders_cubit_state.dart';
import 'open_orders_cubit_state.dart';

class ClosedOrdersCubit extends Cubit<ClosedOrdersCubitState> {

  ClosedOrdersCubit() : super(ClosedOrdersCubitState());

  rebuild(){
    emit(state.copyWith(shouldRebuild: !state.shouldRebuild));
  }
}