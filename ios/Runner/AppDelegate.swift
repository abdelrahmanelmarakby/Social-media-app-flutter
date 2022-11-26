import UIKit
import Flutter
import FBSDKCoreKit


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
  ) -> Bool {
    
FBSDKCoreKit.ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // <Add>
  override func applicationWillResignActive(
    _ application: UIApplication
  ) {
    self.window.isHidden = true;
  }
  override func applicationDidBecomeActive(
    _ application: UIApplication
  ) {
    self.window.isHidden = false;
  }
}
