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
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    private var material: Materials?
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var numberLb: UILabel!
    @IBOutlet weak var bookmarkImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(item: Materials?){
        videoImage.isHidden = true
        if item != nil {
          material = item
          let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
          gestureRecognizer.numberOfTapsRequired = 1
          bookmarkImg.addGestureRecognizer(gestureRecognizer)
            if let urlString = item?.coverPhoto{
            imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
            }
            else {
                imgView.image = UIImage(named: "noimage.png")
            }
            titleLb.text = item?.title
            let timeDiff = (item?.publishDate?.asDate)?.daysSinceNow
            if timeDiff?.year != nil , timeDiff?.year != 0{
                let str = (timeDiff?.year)?.numtoArabic()
                timeLb.text = "منذ " + str! + "سنة"
            }else if timeDiff?.month != nil , timeDiff?.month != 0 {
                let str = (timeDiff?.month)?.numtoArabic()
                timeLb.text = "منذ " + str! + "شهر"
            }else if timeDiff?.weekOfMonth != nil , timeDiff?.weekOfMonth != 0 {
                let str = (timeDiff?.month)?.numtoArabic()
                timeLb.text = "منذ " + str! + "اسبوع"
            }else if timeDiff?.day != nil , timeDiff?.day != 0{
                let str = (timeDiff?.day)?.numtoArabic()
                timeLb.text = "منذ " + str! + "يوم"
            }else if timeDiff?.hour != nil , timeDiff?.hour != 0 {
                let str = (timeDiff?.hour)?.numtoArabic()
                timeLb.text = "منذ " + str! + "ساعة"
            }else if timeDiff?.minute != nil , timeDiff?.minute != 0{
                let str = (timeDiff?.month)?.numtoArabic()
                timeLb.text = "منذ " + str! + "دقيقة"
            }else {
                timeLb.text = "منذ لحظة"
            }
            if let number = item?.noOfViews {
                numberLb.text = "\(number)"
            } else {
                numberLb.text = "\(0)"
            }
            if item?.videos?.count != 0 {
                videoImage.isHidden = false
            }
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("bookmark is tapped")
    }
}
