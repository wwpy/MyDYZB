//
//  Common.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/2.
//

///提供全局共享属性或者方法, 类似于 pch 文件
import UIKit

// MARK:- 全局通知定义
/// 切换根视图控制器通知
let DYSwitchRootViewControllerNotification = "DYSwitchRootViewControllerNotification"

/// 全局外观渲染颜色 -> 延展出`配色`的管理器
let DYAppearanceTintColor = UIColor.orange

// 状态栏高度
let kStatusH: CGFloat = 48
// 导航栏高度
let kNavigationBarH: CGFloat = 44
// 底部TabBar高度
let kTabbarH: CGFloat = 49

// 屏幕宽度
let kScreenW = UIScreen.main.bounds.width
// 屏幕高度
let kScreenH = UIScreen.main.bounds.height

///服务器地址
#if PRODUCTION
let baseDomain = "http://capi.douyucdn.cn"
let basePicPath = "http://www.baidu.com/upload"
#else
let baseDomain = "http://capi.douyucdn.cn"
let basePicPath = "http://192.168.1.213:8002/upload"
#endif

// MARK:- 全局函数
/// 延迟在主线程执行函数
func delay(delta: Int, callback: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delta), execute: callback)
}
