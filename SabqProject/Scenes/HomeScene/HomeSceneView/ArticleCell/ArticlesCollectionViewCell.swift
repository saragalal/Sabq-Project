//
//  ArticlesCollectionViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
class ArticlesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell(item: Materials?){
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        if item != nil {
        nameLb.text = item?.authorName
        titleLb.text = item?.title
        self.imgView.layer.masksToBounds = false
        self.imgView.layer.cornerRadius = self.imgView.frame.height/2
        self.imgView.clipsToBounds = true
        if let urlString = item?.authorImg{
            imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
        }
        else {
            imgView.image = UIImage(named: "noimage.png")
        }
    }
  }
}
