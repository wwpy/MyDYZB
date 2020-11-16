//
//  CollectionNormalCell.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/10.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    // MARK:- 设置属性
    @IBOutlet weak var roomnameLabel: UILabel!
    
    // MARK:- 定义模型属性
    override var anchor: AnchorModel? {
        didSet {
            // 1. 将属性传递给父类
            super.anchor = anchor
            // 2. 设置房间名称
            roomnameLabel.text = anchor?.room_name
        }
    }
    
}
