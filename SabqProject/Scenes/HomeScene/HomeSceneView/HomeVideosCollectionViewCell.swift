//
//  HomeVideosCollectionViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
class HomeVideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var durationLb: UILabel!
    @IBOutlet weak var bookmarkImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  func configureCell(item: Comics?) {
        titleLb.text = item?.title
        if let urlString = item?.coverPhoto{
            imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
        }
        else {
            imgView.image = UIImage(named: "noimage.png")
        }
    }
}
