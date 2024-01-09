import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:shift_tracking_data/models/shift_dto/shift_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'remote_cashdrawer_cubit_state.freezed.dart';
part 'remote_cashdrawer_cubit_state.g.dart';

@freezed
class RemoteCashDrawerCubitState with _$RemoteCashDrawerCubitState {

  const factory RemoteCashDrawerCubitState({
    @Default(true) bool isLoading,
    @Default(['']) List<String> posDropdownValues,
    @Default(['']) List<String> userDropdownValues,
    @Default(['']) List<String> posCounterDropdownValues,
    @Default('OPEN') String tabValue,
    @Default([]) List<ShiftDTO> openShiftList,
    @Default('') String systemCash,
    @Default('') String systemCardCount,
    @Default('') String systemGameCard,
    @Default('') String systemCreditCard,
    @Default('') String systemOthers,
    @Default('') String systemCoupons,
    @Default('') String systemTicket,
    @Default('') String cash,
    @Default('') String cardCount,
    @Default('') String gameCard,
    @Default('') String creditCard,
    @Default('') String others,
    @Default('') String coupons,
    @Default('') String ticket,
    @Default([]) List<UserContainerDTO>? userContainer,
    @Default([]) List<POSMachineContainerDTO>? posMachineContainer,
  }) = _RemoteCashDrawerCubitState;

  factory RemoteCashDrawerCubitState.fromJson(Map<String, dynamic> json) => _$RemoteCashDrawerCubitStateFromJson(json);
}
