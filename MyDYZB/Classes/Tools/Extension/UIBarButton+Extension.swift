//
//  UIBarButton+Extension.swift
//  MyDYZB
//
//  Created by 王武 on 2020/10/25.
//

import UIKit

extension UIBarButtonItem {
    /*
     class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
         let btn = UIButton()
         btn.setImage(UIImage(named: imageName), for: .normal)
         btn.setImage(UIImage(named: highImageName), for: .highlighted)
         btn.frame = CGRect(origin: CGPoint.zero, size: size)
         
         return UIBarButtonItem(customView: btn)
     }
     */

    // 1.convenience 2.调用一个设计的构造函数
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        // 1.创建UIButton
        let btn = UIButton()
        // 2.设置btn图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        // 3.设置btn尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        // 4.创建UIBarButtonItem
        self.init(customView: btn)
    }
    
}
