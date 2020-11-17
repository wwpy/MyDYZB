//
//  UIColor+Extension.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/3.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 225.0, blue: b / 255.0, alpha: 1.0)
    }
    
    /// 获取随机颜色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
