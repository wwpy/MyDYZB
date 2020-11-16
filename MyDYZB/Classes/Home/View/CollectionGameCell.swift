//
//  CollectionGameCell.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/16.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    // 定义模型属性
    var group: AnchorGroup? {
        didSet {
            titleLable.text = group?.tag_name
            let iconURL = URL(string: group?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "More_Normal"))
        }
    }


}
