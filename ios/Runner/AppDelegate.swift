import UIKit
import Flutter
import AppTrackingTransparency
import AdSupport

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        //request permission
        requestTrackingPermission()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    
    func requestTrackingPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // 用户同意跟踪，可以执行相应操作
                    // 例如启动广告跟踪服务
                    let identifier = ASIdentifierManager.shared().advertisingIdentifier
                    print("Advertising Identifier: \(identifier)")
                case .denied:
                    // 用户拒绝跟踪，需要适当处理
                    print("Tracking authorization denied")
                case .notDetermined:
                    // 用户还未做出选择，可以继续观察或提醒用户做出选择
                    print("Tracking authorization not determined")
                case .restricted:
                    // 跟踪功能受到限制，可能是由于家长控制或企业策略
                    print("Tracking authorization restricted")
                @unknown default:
                    break
                }
            }
        } else {
            // 对于不支持 iOS 14 的设备，可以采取其他措施
            print("App Tracking Transparency is not available on this device")
        }
    }
    
}
