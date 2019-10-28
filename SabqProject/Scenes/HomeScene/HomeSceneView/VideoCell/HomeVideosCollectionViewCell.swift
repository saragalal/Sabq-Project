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

    
    @IBOutlet weak var loadedImg: UIImageView!
    @IBOutlet weak var shimmerView: FBShimmeringView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var durationLb: UILabel!
    @IBOutlet weak var bookmarkImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  func configureCell(item: Comics?) {
    self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        titleLb.text = item?.title
     showLoading()
    if let urlString = item?.authorImg{
            //imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
            imgView.sd_setImage(with: URL(string: urlString)) { (image, error, cache, url) in
               self.hideLoading()
                if error != nil {
                   self.imgView.image = UIImage(named: "noimage.png")
                }
            }
        }
        else {
            imgView.image = UIImage(named: "noimage.png")
        }
    }
  func showLoading() {
        shimmerView.isHidden = false
       
       shimmerView.contentView = loadedImg
        shimmerView.isShimmering = true
        shimmerView.shimmeringPauseDuration = 0.2
        shimmerView.shimmeringAnimationOpacity = 0.5
        shimmerView.shimmeringOpacity = 1.0
        shimmerView.shimmeringSpeed = 230
        shimmerView.shimmeringHighlightLength = 1.0
        shimmerView.shimmeringDirection = .right
    }
   func hideLoading() {
        shimmerView.isShimmering = false
        shimmerView.isHidden = true
    }
}
