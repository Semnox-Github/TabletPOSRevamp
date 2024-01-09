import UIKit
import Flutter
import CoreBluetooth

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, CBCentralManagerDelegate {
    var consoleMsg = ""
    var manager : CBCentralManager?
//    var bluetoothChannel : FlutterMethodChannel?
//    var bluetoothSettingsChannel : FlutterMethodChannel?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
//            let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//            bluetoothChannel = FlutterMethodChannel(name: "semnox.tablet.pos/bluetooth",
//                                                    binaryMessenger: controller.binaryMessenger)
//            bluetoothChannel?.setMethodCallHandler({
//                [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
//                guard call.method == "getBluetoothState" else {
//                    result(FlutterMethodNotImplemented)
//                    return
//                }
//                self?.receiveBluetoothState(result: result)
//            })
//
//            bluetoothSettingsChannel = FlutterMethodChannel(name: "semnox.tablet.pos/bluetoothSettings",
//                                                            binaryMessenger: controller.binaryMessenger)
//            bluetoothSettingsChannel?.setMethodCallHandler({
//                [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
//                guard call.method == "openBluetoothSettings" else {
//                    result(FlutterMethodNotImplemented)
//                    return
//                }
//                self?.openBluetoothSettings(result: result)
//            })
            
            GeneratedPluginRegistrant.register(with: self)
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    
    private func openBluetoothSettings(result: FlutterResult) {
        UIApplication.shared.open(URL(string: "App-prefs:Bluetooth")!)
    }

    private func receiveBluetoothState(result: FlutterResult) {
        self.viewDidLoad()
        result(consoleMsg)
    }
    
    func viewDidLoad() {
        manager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: false])
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        switch central.state {
//        case .poweredOn:
//            consoleMsg = "ON"
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "ON")
//            break
//        case .poweredOff:
//            consoleMsg = "OFF"
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "OFF")
//            break
//        case .resetting:
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "RESETTING")
//            break
//        case .unauthorized:
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "UNAUTHORIZED")
//            break
//        case .unsupported:
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "UNSUPPORTED")
//            break
//        case .unknown:
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "UNKNOWN")
//            break
//        default:
//            self.bluetoothChannel?.invokeMethod("Bluetooth Connectivity Status", arguments: "ERROR")
//            break
//        }
    }
}
