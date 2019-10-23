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
        sliderAdaptor = SliderCellAdaptor()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configureSliderCell(sliderArray: [Slider?]) {
        //self.slides = sliderArray.reversed()
        sliderAdaptor?.add(item: sliderArray.reversed())
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        self.restartAction(self)
        self.addSubview(self.pageViewController.view)
        self.pageViewController.view.frame = self.cellView.frame
        self.sectionOnePageControl.numberOfPages = (sliderAdaptor?.count(name: "slider"))!
        self.sectionOnePageControl.currentPage = (sliderAdaptor?.count(name: "slider"))! - 1
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
    func restartAction(_ sender: AnyObject) {
        if let count = sliderAdaptor?.count(name: "slider"){
         self.pageViewController.setViewControllers([self.viewControllerAtIndex(index: count - 1)], direction: .forward, animated: true, completion: nil)
     }
    }
    func viewControllerAtIndex(index: Int) -> HomeFirstSectionViewController {
        if let count = (sliderAdaptor?.count(name: "slider")) {
        if (count == 0) || (index >= count) {
           return HomeFirstSectionViewController(nibName: "HomeFirstSectionViewController", bundle: .main)
         }
        }
        let vc = HomeFirstSectionViewController(nibName: "HomeFirstSectionViewController", bundle: .main)
        vc.pageIndex = index
        vc.setSliderItem(item: sliderAdaptor?.getItem(at: index))
        return vc
    }
    
}
extension SliderTableViewCell : UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! HomeFirstSectionViewController
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! HomeFirstSectionViewController
        var index = vc.pageIndex as Int
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if (index == (sliderAdaptor?.count(name: "slider"))!) {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return (sliderAdaptor?.count(name: "slider"))!
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        if (!completed)
        {
            return
        }
        self.sectionOnePageControl.currentPage = self.lastPendingViewControllerIndex //Page Index
    }
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]){
        if let viewController = pendingViewControllers[0] as? HomeFirstSectionViewController {
            self.lastPendingViewControllerIndex = viewController.pageIndex
        }
    }
    
}
