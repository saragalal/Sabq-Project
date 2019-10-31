//
//  SliderCellAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/23/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class SliderCellAdaptor: NSObject, BaseViewAdaptorProtocal {
    var reloadData: (() -> Void)?
    typealias DataType = [Slider?]
    var data: [Slider?]?
    var pageViewController: UIPageViewController!
    var pageController: UIPageControl!
    var lastPendingViewControllerIndex = 0
    func setAdaptor(pager: UIPageViewController, pageController: UIPageControl) {
        self.pageViewController = pager
        self.pageController = pageController
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
    }
    func count(name array: String) -> Int? {
        return data?.count
    }
    
    func clear(reload: Bool) {
        
    }
    
    func add(item: [Slider?]?) {
        self.data = item
    }
    
    func getItem(at index: Int) -> Slider? {
        return data?[index]
    }
    func restartAction(_ sender: AnyObject) {
        if let count = self.count(name: String.slider()) {
self.pageViewController.setViewControllers([self.viewControllerAtIndex(index: count - 1)],
                                           direction: .forward,
                                           animated: true,
                                           completion: nil)
        }
    }
    func viewControllerAtIndex(index: Int) -> HomeFirstSectionViewController {
        if let sliderCount = (self.count(name: String.slider())) {
            if (sliderCount == 0) || (index >= sliderCount) {
                return HomeFirstSectionViewController(nibName: String.sliderViewSection(), bundle: .main)
            }
        }
        let vc = HomeFirstSectionViewController(nibName: String.sliderViewSection(), bundle: .main)
        vc.pageIndex = index
        vc.setSliderItem(item: self.getItem(at: index))
        return vc
    }
    
}
extension SliderCellAdaptor: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? HomeFirstSectionViewController
        if var index = vc?.pageIndex {
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? HomeFirstSectionViewController
        if var index = vc?.pageIndex {
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if let sliderCount = self.count(name: String.slider()) {
        if index == sliderCount {
            return nil
         }
    }
        return self.viewControllerAtIndex(index: index)
     }
         return nil
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        if let countpage = self.count(name: String.slider()) {
        return countpage
        }
        return 0
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if (!completed) {
            return
        }
        self.pageController.currentPage = self.lastPendingViewControllerIndex
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            willTransitionTo pendingViewControllers: [UIViewController]) {
        if let viewController = pendingViewControllers[0] as? HomeFirstSectionViewController {
            self.lastPendingViewControllerIndex = viewController.pageIndex
        }
    }
    
}
