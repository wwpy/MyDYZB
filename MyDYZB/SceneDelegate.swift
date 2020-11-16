//
//  SceneDelegate.swift
//  MyDYZB
//
//  Created by 王武 on 2020/10/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        /// 设置全局外观
        setupAppearance()
        // 设置baseURL
        initApp()
        
        // 监听通知
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: DYSwitchRootViewControllerNotification), // 通知名称, 通知中心用来识别通知的
            object: nil,                                                                    // 发送通知的对象, 为nil 监听任何对象
            queue: nil)                                                                     // nil 是主线程
        { [weak self](notification) in
            // 切换控制器
            let vc = notification.object != nil ? LiveViewController() : ProfileViewController()
            self?.window?.rootViewController = vc
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    deinit {
        // 注销通知 - 注销指定通知
        NotificationCenter.default.removeObserver(
            self,                                                                   // 监听者
            name: NSNotification.Name("DYSwitchRootViewControllerNotification"),    // 监听的通知
            object: nil)                                                            // 发送通知的对象
    }
    
    private func initApp() {
        /// 设定baseURL
        let apiURL = URL(string: baseDomain)
        EWNetworkTools.ShareInstance.updateBaseUrl(baseUrl: (apiURL?.absoluteString)!)
        ///注册监听网络状态
        EWNetworkTools.ShareInstance.obtainDataFromLocalWhenNetworkUnconnected()
    }
    
    /// 设置全局外观
    private func setupAppearance() {
        UINavigationBar.appearance().tintColor = DYAppearanceTintColor
        UITabBar.appearance().tintColor = DYAppearanceTintColor
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

// MARK:- 界面切换代码
extension SceneDelegate {
    ///启动根视图控制器
    private var defaultRootViewController: UIViewController {
        // 1.判断是否登录

        // 2.没有登录返回主控制器
        return HomeViewController()
    }
    
    ///判断是否新版本
    private var isNewVersion: Bool {
        // 1.当前版本
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let version = Double(currentVersion)!
        // 2.上一个版本, 把当前版本保存在用户偏好 key不存在返回 0
        let sandboxVersionKey = "sandboxVersionKey"
        let sandboxVersion = UserDefaults.standard.double(forKey: sandboxVersionKey)
        // 3.保存当前版本
        UserDefaults.standard.setValue(version, forKey: sandboxVersionKey)
        
        return version > sandboxVersion
    }
}
