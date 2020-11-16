//
//  CollectionPrettyCell.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/11.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var cityBtn: UIButton!
    
    // MARK:- 定义模型属性
    override var anchor: AnchorModel? {
        didSet {
            // 1. 将属性传递给父类
            super.anchor = anchor
            // 2. 设置城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
        }
    }

}
