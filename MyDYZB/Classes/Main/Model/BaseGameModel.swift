//
//  BaseGameModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/16.
//

import UIKit

class BaseGameModel: NSObject {
    // MARK:- 定义属性
    /// 标题
    @objc var tag_name: String = ""
    /// 图标
    @objc var icon_url: String = ""
    
    // MARK:- 自定义构造函数
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
