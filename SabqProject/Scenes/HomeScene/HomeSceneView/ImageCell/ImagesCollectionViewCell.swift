//
//  ImagesCollectionViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(item: Comics?){
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        if item != nil {
            titleLb.text = item?.title
            if let urlString = item?.coverPhoto{
                imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
            }
            else {
                imgView.image = UIImage(named: "noimage.png")
            }
        }
    }
}
