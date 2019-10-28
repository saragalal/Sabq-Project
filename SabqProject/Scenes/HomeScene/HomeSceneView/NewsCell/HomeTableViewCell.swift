//
//  HomeTableViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var loadedImg: UIImageView!
    @IBOutlet weak private var shimmerView: FBShimmeringView!
    @IBOutlet weak private var categoryLb: UILabel!
    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var videoImage: UIImageView!
    @IBOutlet weak private var titleLb: UILabel!
    private var material: Materials?
    @IBOutlet weak private var timeLb: UILabel!
    @IBOutlet weak private var numberLb: UILabel!
    @IBOutlet weak private var bookmarkImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(item: Materials?) {
        videoImage.isHidden = true
        if item != nil {
          material = item
            setTimeLabel(item: item)
          let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
          gestureRecognizer.numberOfTapsRequired = 1
          bookmarkImg.addGestureRecognizer(gestureRecognizer)
            if let urlString = item?.coverPhoto {
           // imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
                showLoading()
                imgView.sd_setImage(with: URL(string: urlString)) { (image, error, _, _) in
                    self.hideLoading()
                    if error != nil {
                        self.imgView.image = #imageLiteral(resourceName: "noimage")
                    }
                }
             } else {
                imgView.image = #imageLiteral(resourceName: "noimage")
            }
            titleLb.text = item?.title
            categoryLb.text = item?.parentCategoryName
            if let number = item?.noOfViews {
                numberLb.text = "\(number)"
            } else {
                numberLb.text = "\(0)"
            }
            if !(item?.videos?.isEmpty ?? true) {
                videoImage.isHidden = false
            }
        }
    }
    @objc
    func handleTap(_ sender: UITapGestureRecognizer) {
        print("bookmark is tapped")
    }
    func setTimeLabel(item: Materials?) {
        let timeDiff = (item?.publishDate?.asDate)?.daysSinceNow
                   if timeDiff?.year != nil, timeDiff?.year != 0 {
                       if let str = (timeDiff?.year)?.numtoArabic() {
                           timeLb.text = "منذ " + str + "سنة"
                       }
                   } else if timeDiff?.month != nil, timeDiff?.month != 0 {
                       if let str = (timeDiff?.month)?.numtoArabic() {
                           timeLb.text = "منذ " + str + "شهر"
                       }
                   } else if timeDiff?.weekOfMonth != nil, timeDiff?.weekOfMonth != 0 {
                       if let str = (timeDiff?.month)?.numtoArabic() {
                           timeLb.text = "منذ " + str + "اسبوع"
                       }
                   } else if timeDiff?.day != nil, timeDiff?.day != 0 {
                       if let str = (timeDiff?.day)?.numtoArabic() {
                           timeLb.text = "منذ " + str + "يوم"
                       }
                   } else if timeDiff?.hour != nil, timeDiff?.hour != 0 {
                       if let str = (timeDiff?.hour)?.numtoArabic() {
                           timeLb.text = "منذ " + str + "ساعة"
                       }
                   } else if timeDiff?.minute != nil, timeDiff?.minute != 0 {
                       if let str = (timeDiff?.month)?.numtoArabic() {
                           timeLb.text = "منذ " + str + "دقيقة"
                       }
                   } else {
                       timeLb.text = "منذ لحظة"
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
