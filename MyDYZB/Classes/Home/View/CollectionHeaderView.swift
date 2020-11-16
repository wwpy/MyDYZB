//
//  CollectionHeaderView.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/10.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    // MARK:- 控件属性
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK:- 定义模型属性
    var group: AnchorGroup? {
        didSet {
            titleLable.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "CollHeader_Play")
        }
    }
}
