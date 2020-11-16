//
//  CycleModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/16.
//

import UIKit

class CycleModel: NSObject {
    // 标题
    var title: String = ""
    // 展示图片地址
    var pic_url: String = ""
    // 主播信息对应的字典
    var room: [String : Any]? {
        didSet {
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    // 主播信息对应的模型对象
    var anchor: AnchorModel?
    
    // MARK:- 自定义构造函数
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
