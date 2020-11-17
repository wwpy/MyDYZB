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
    var baseGame: BaseGameModel? {
        didSet {
            titleLable.text = baseGame?.tag_name
            if let iconURL = URL(string: baseGame?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "More_Normal")
            }
        }
    }


}
