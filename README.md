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

