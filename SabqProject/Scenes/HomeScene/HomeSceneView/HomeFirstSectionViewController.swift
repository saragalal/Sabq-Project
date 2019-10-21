//
//  HomeFirstSectionViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
class HomeFirstSectionViewController: UIViewController {

    var pageIndex: Int = 0
    var sliderItem: Slider?
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgSlider: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if sliderItem != nil {
            titleLabel.text = sliderItem?.title
            numberLabel.text = "\(sliderItem?.noOfViews ?? 0)"
            bodyLabel.text = sliderItem?.description?.htmlToString
            if let urlString = sliderItem?.coverPhoto{
                imgSlider.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
            }
            else {
                imgSlider.image = UIImage(named: "noimage.png")
            }
        }
    }
    func setSliderItem(item: Slider?){
        sliderItem = item
    }
}
