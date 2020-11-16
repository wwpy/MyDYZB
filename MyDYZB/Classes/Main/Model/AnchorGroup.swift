//
//  AnchorGroup.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/11.
//

import UIKit

class AnchorGroup: NSObject {
    /// 房间信息
    @objc var room_list: [[String : Any]]? {
        didSet {
            guard let room_list = room_list else { return }
            
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    /// 标题
    @objc var tag_name: String = ""
    /// 图标
    @objc var icon_name: String = "CollHeader_Play"
    /// 游戏对应的图标
    @objc var icon_url: String = ""
    // 定义主播的模型对象数组
    public lazy var anchors: [AnchorModel] = [AnchorModel]()
    
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        super.setValue(value, forKey: key)
//    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    /*
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "room_list" {
            if let dataArray = value as? [[String : Any]] {
                for dict in dataArray {
                    anchors.append(AnchorModel(dict: dict))
                }
            }
        }
    }
     */
    
}
