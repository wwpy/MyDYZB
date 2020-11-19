```swift
import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK:- 定义模型属性
    var cycleModel: CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")
          	// 设置图片，默认图片
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "CollCell_PlaceHolder"))
        }
    }
    
    override func awakeFromNib() {
//        autoresizingMask = [.flexibleWidth]
    }
    
}
```

