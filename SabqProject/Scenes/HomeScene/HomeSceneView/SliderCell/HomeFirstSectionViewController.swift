//
//  HomeFirstSectionViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
import NSDate_TimeAgo
class HomeFirstSectionViewController: UIViewController {

    var pageIndex: Int = 0
    var sliderItem: Slider?
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var numberLabel: UILabel!
    @IBOutlet weak private var bodyLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private  var imgSlider: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if sliderItem != nil {
            titleLabel.text = sliderItem?.title
            numberLabel.text = "\(sliderItem?.noOfViews ?? 0)"
            bodyLabel.text = sliderItem?.description?.htmlToString
            setTimeLabel()
            let palceholder = #imageLiteral(resourceName: "noimage")
            if let urlString = sliderItem?.coverPhoto {
                imgSlider.sd_setImage(with: URL(string: urlString), placeholderImage: palceholder)
            } else {
                imgSlider.image = palceholder
            }
        }
    }
    func setSliderItem(item: Slider?) {
        sliderItem = item
    }
    func setTimeLabel() {
        let timeDiff = (sliderItem?.publishDate?.asDate)?.daysSinceNow
                   if timeDiff?.year != nil, timeDiff?.year != 0 {
                       if let str = (timeDiff?.year)?.numtoArabic() {
                       timeLabel.text = "منذ " + str + "سنة"
                       }
                   } else if timeDiff?.month != nil, timeDiff?.month != 0 {
                       if let str = (timeDiff?.month)?.numtoArabic() {
                       timeLabel.text = "منذ " + str + "شهر"
                       }
                   } else if timeDiff?.weekOfMonth != nil, timeDiff?.weekOfMonth != 0 {
                       if let str = (timeDiff?.weekOfMonth)?.numtoArabic() {
                       timeLabel.text = "منذ " + str + "اسبوع"
                       }
                   } else if timeDiff?.day != nil, timeDiff?.day != 0 {
                       if let str = (timeDiff?.day)?.numtoArabic() {
                       timeLabel.text = "منذ " + str + "يوم"
                       }
                   } else if timeDiff?.hour != nil, timeDiff?.hour != 0 {
                       if let str = (timeDiff?.hour)?.numtoArabic() {
                       timeLabel.text = "منذ " + str + "ساعة"
                       }
                   } else if timeDiff?.minute != nil, timeDiff?.minute != 0 {
                       if let str = (timeDiff?.month)?.numtoArabic() {
                       timeLabel.text = "منذ " + str + "دقيقة"
                       }
                   } else {
                       timeLabel.text = "منذ لحظة"
                    }
    }
}
extension Int {
   //    swiftlint:disable cyclomatic_complexity
  //     swiftlint:disable function_body_length
    func numtoArabic() -> String {
        if self == 1 {
            return "١"
        }
        if self == 2 {
            return "٢"
        }
        if self == 3 {
            return "٣"
        }
        if self == 4 {
            return "٤"
        }
        if self == 5 {
            return "٥"
        }
        if self == 6 {
            return "٦"
        }
        if self == 7 {
            return "٧"
        }
        if self == 8 {
            return "٨"
        }
        if self == 9 {
            return "٩"
        }
        if self == 10 {
            return "١٠"
        }
        if self == 11 {
            return "١١"
        }
        if self == 12 {
            return "١٣"
        }
        if self == 13 {
            return "١٢"
        }

        if self == 14 {
            return "١٤"
        }

        if self == 15 {
            return "١٥"
        }

        if self == 16 {
            return "١٦"
        }

        if self == 17 {
            return "١٧"
        }
        if self == 18 {
            return "١٨"
        }
        if self == 19 {
            return "١٩"
        }
        if self == 20 {
            return "٢٠"
        }
        if self == 21 {
            return "٢١"
        }
        if self == 22 {
            return "٢٢"
        }
        if self == 23 {
            return "٢٣"
        }
        if self == 24 {
            return "٢٤"
        }
        if self == 25 {
            return "٢٥"
        }
        if self == 26 {
            return "٢٦"
        }
        if self == 27 {
            return "٢٧"
        }
        if self == 28 {
            return "٢٨"
        }
        if self == 29 {
            return "٢٩"
        }
        if self == 30 {
            return "٣٠"
        }
        if self == 31 {
            return "٣١"
        }
        return "٠"
    }
}
