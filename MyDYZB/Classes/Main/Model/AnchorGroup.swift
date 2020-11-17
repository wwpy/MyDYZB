//
//  AnchorGroup.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/11.
//

import UIKit

class AnchorGroup: BaseGameModel {
    /// 房间信息
    @objc var room_list: [[String : Any]]? {
        didSet {
            guard let room_list = room_list else { return }
            
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    /// 图标
    @objc var icon_name: String = "CollHeader_Play"

    // 定义主播的模型对象数组
    public lazy var anchors: [AnchorModel] = [AnchorModel]()
    
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
