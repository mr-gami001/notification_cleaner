import Flutter
import UIKit
import UserNotifications

public class SwiftNotificationCleanerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "notification_cleaner", binaryMessenger: registrar.messenger())
    let instance = SwiftNotificationCleanerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "clearAllNotifications") {
      clearAllNotifications(result: result)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func clearAllNotifications(result: @escaping FlutterResult) {
    if #available(iOS 10.0, *) {
      UIApplication.shared.applicationIconBadgeNumber = 0
      let center = UNUserNotificationCenter.current()
      center.removeAllDeliveredNotifications()
      center.removeAllPendingNotificationRequests()
      result(nil) 
    } else {
      result(FlutterError(code: "UNSUPPORTED", message: "iOS version not supported", details: nil))
    }
  }
}
