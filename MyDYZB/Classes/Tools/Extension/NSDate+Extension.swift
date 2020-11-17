//
//  NSDate+Extension.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/11.
//

import Foundation

extension NSDate {
    /// 获取当前时间
    static  func getCurrentTime() -> String {
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
