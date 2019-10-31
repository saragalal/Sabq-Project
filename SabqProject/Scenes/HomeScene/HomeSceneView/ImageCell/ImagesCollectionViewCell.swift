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
    @IBOutlet weak private var loadedImg: UIImageView!
    @IBOutlet weak private var shimmerView: FBShimmeringView!
    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var timeLb: UILabel!
    @IBOutlet weak private var titleLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(item: Comics?) {
        self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
        if item != nil {
            titleLb.text = item?.title
            if let date = (item?.publishDate)?.asDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            let timeStr = formatter.string(from: date)
            timeLb.text = timeStr
            }
            showLoading()
            let placeholder = #imageLiteral(resourceName: "noimage")
            if let urlString = item?.coverPhoto {
                //imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
                imgView.sd_setImage(with: URL(string: urlString)) { (image, error, _, _) in
                   self.hideLoading()
                    if error != nil {
                       self.imgView.image = placeholder
                    }
                }
            } else {
                imgView.image = placeholder
            }
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
         shimmerView.shimmeringDirection = .down
     }
    func hideLoading() {
         shimmerView.isShimmering = false
         shimmerView.isHidden = true
     }
}
