## 仿斗鱼直播

### 项目目录

[斗鱼项目目录](./doc/z_video/catalog.mov)

```swift
/*
非iPhoneX：状态栏高度(20.f) + 导航栏高度(44.f) = 64f
iPhoneX系列：状态栏高度(44.f) + 导航栏高度(44.f) = 88f
ios 14
状态栏高度(48.f) + 导航栏高度(44.f) = 92f
*/
// 不调整UIScrollView的内边距 （已经废弃）不需要设置
automaticallyAdjustsScrollViewInsets = false
```

### 状态栏和导航栏

```swift
//获取状态栏的rect
CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
//获取导航栏的rect
CGRect navRect = self.navigationController.navigationBar.frame;
//导航栏+状态栏的高度
statusRect.size.height+navRect.size.height
// iOS14

```

```swift
override var prefersStatusBarHidden: Bool {
		return false
}
```

### 项目中使用到的框架

[Alamofire](./doc/Alamofire.md)

[Kingfisher](./doc/Kingfisher.md)

### 项目中使用到的扩展 extension

[UIBarButton+Extension](./MyDYZB/Classes/Tools/Extension/UIBarButton+Extension.swift)

[UIColor+Extension](./MyDYZB/Classes/Tools/Extension/UIColor+Extension.swift)

[NSDate+Extension](./MyDYZB/Classes/Tools/Extension/NSDate+Extension)

[String+Extension](./MyDYZB/Classes/Tools/Extension/String+Extension)

### 监听通知

```swift
// 监听通知
NotificationCenter.default.addObserver(
  forName: NSNotification.Name(
    rawValue: DYSwitchRootViewControllerNotification), // 通知名称, 通知中心用来识别通知的
  object: nil,                                           // 发送通知的对象, 为nil 监听任何对象
  queue: nil)                                            // nil 是主线程
{ [weak self](notification) in
 // 切换控制器
 let vc = notification.object != nil ? LiveViewController() : ProfileViewController()
 self?.window?.rootViewController = vc
}

// 注销通知 - 注销指定通知
NotificationCenter.default.removeObserver(
  self,                                                                   // 监听者
  name: NSNotification.Name("DYSwitchRootViewControllerNotification"),    // 监听的通知
  object: nil)                                                            // 发送通知的对象
```

### 设置服务地址和网络监听

```swift
private func initApp() {
  /// 设定baseURL
  let apiURL = URL(string: baseDomain)
  EWNetworkTools.ShareInstance.updateBaseUrl(baseUrl: (apiURL?.absoluteString)!)
  ///注册监听网络状态
  EWNetworkTools.ShareInstance.obtainDataFromLocalWhenNetworkUnconnected()
}
```



