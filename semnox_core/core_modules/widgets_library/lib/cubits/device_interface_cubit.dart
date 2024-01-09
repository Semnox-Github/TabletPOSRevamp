import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets_library/cubits/device_interface_state.dart';

class DeviceInterfaceCubit extends Cubit<DeviceInterfaceState> {

  DeviceInterfaceCubit() : super(const DeviceInterfaceState());

  DeviceInterfaceState copyWith({
    Function()? barCodeResult,
    Function()? printContent,
    bool isPrintingOngoing = false,
    bool isPaymentScannerEnabled = false
  }) {
    return DeviceInterfaceState(
      barCodeResult: barCodeResult != null ? barCodeResult() : state.barCodeResult,
      printContent: printContent != null ? printContent() : state.printContent,
      isPrintingOngoing: isPrintingOngoing,
      isPaymentScannerEnabled: isPaymentScannerEnabled
    );
  }

  void setPrinterContent(String? content) {
    emit(copyWith(printContent: () => content));
  }

  void setPrintOngoingStatus(bool printerStatus) {
    emit(copyWith(isPrintingOngoing: printerStatus));
  }

  void setBarCodeResult(String? content) {
    emit(copyWith(barCodeResult: () => content));
  }

  void setPaymentScannerStatus(bool paymentScannerStatus) {
    emit(copyWith(isPaymentScannerEnabled: paymentScannerStatus));
  }
}