//
//  AnchorModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/11.
//

import UIKit

class AnchorModel: NSObject {
    // 房间ID
    @objc var room_id: Int = 0
    // 房间图片对应的URLString
    @objc var vertical_src: String = ""
    // 判断是手机直播还是PC直播
    // 0： PC直播，1：手机直播
    @objc var isVertical: Int = 0
    // 房间名称
    @objc var room_name: String = ""
    // 主播昵称
    @objc var nickname: String = ""
    // 观看人数
    @objc var online: Int = 0
    // 所在城市
    @objc var anchor_city: String = ""
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        super.setValue(value, forKey: key)
//    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
