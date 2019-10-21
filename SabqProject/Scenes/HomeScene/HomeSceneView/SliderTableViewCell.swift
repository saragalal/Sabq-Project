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
    var slides = [Slider?]()
    var pageViewController: UIPageViewController!
    var lastPendingViewControllerIndex = 0
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureSliderCell(sliderArray: [Slider?]) {
        self.slides = sliderArray
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        self.restartAction(self)
        self.addSubview(self.pageViewController.view)
        self.pageViewController.view.frame = self.cellView.frame
        self.sectionOnePageControl.numberOfPages = sliderArray.count
        self.sectionOnePageControl.currentPage = 0
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
        self.pageViewController.setViewControllers([self.viewControllerAtIndex(index: 0)], direction: .forward, animated: true, completion: nil)
    }
    func viewControllerAtIndex(index: Int) -> HomeFirstSectionViewController {
        if (slides.count == 0) || (index >= slides.count) {
            return HomeFirstSectionViewController(nibName: "HomeFirstSectionViewController", bundle: .main)
        }
        let vc = HomeFirstSectionViewController(nibName: "HomeFirstSectionViewController", bundle: .main)
        vc.pageIndex = index
        vc.setSliderItem(item: slides[index])
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
        if (index == slides.count) {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return slides.count
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
