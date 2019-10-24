//
//  SliderTableViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionOnePageControl: UIPageControl!
    private var sliderAdaptor: SliderCellAdaptor?
    var pageViewController: UIPageViewController!
    var lastPendingViewControllerIndex = 0
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   }
    func configureSliderCell(sliderArray: [Slider?]) {
        sliderAdaptor = SliderCellAdaptor()
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        sliderAdaptor?.setAdaptor(pager: pageViewController, pageController: sectionOnePageControl)
        sliderAdaptor?.add(item: sliderArray.reversed())
        sliderAdaptor?.restartAction(self)
        self.addSubview(self.pageViewController.view)
        self.pageViewController.view.frame = self.cellView.frame
        self.sectionOnePageControl.numberOfPages = (sliderAdaptor?.count(name: String.slider()))!
        self.sectionOnePageControl.currentPage = (sliderAdaptor?.count(name: String.slider()))! - 1
        self.sectionOnePageControl.tintColor = UIColor.hexStringToUIColor(hex: "4ABCF9")
        self.sectionOnePageControl.pageIndicatorTintColor = UIColor.gray
        self.sectionOnePageControl.currentPageIndicatorTintColor = UIColor.hexStringToUIColor(hex: "4ABCF9")
        let views = [
            "pg": self.pageViewController.view
        ]
        for (_, v) in views {
            v!.translatesAutoresizingMaskIntoConstraints = false
            self.cellView.addSubview(v!)
        }
    }
}
