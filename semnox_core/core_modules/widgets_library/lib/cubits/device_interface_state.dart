
class DeviceInterfaceState {
  final String? barCodeResult;
  final String? printContent;
  final bool isPrintingOngoing;
  final bool isPaymentScannerEnabled;

  const DeviceInterfaceState({
    this.barCodeResult,
    this.printContent,
    this.isPrintingOngoing = false,
    this.isPaymentScannerEnabled = false
  });
}