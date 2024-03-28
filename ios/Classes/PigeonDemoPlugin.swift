import Flutter
import UIKit

public class PigeonDemoPlugin: NSObject, FlutterPlugin, DemoApi {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pigeon_demo", binaryMessenger: registrar.messenger())
    let instance = PigeonDemoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance);
    DemoApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance);
  }


  func getPigeonStats(completion: @escaping (Result<PigeonStats, any Error>) -> Void) {
  }

  func makePigeonSpeak(text: String) throws -> String {
    return "";
  }

  func pokePigeon() throws {
    let rootViewController = UIApplication.shared.keyWindow?.rootViewController;
    let alertController = UIAlertController(title: "COOOOOO", message: "COOO", preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(defaultAction)

    if var topController = rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        topController.present(alertController, animated: true, completion: nil)
    }
  }
  

}
