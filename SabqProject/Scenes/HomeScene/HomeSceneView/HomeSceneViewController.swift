//
//  HomeSceneViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class HomeSceneViewController: BaseViewController, HomeSceneViewProtocol ,viewAdaptorDelegate{
    
    @IBOutlet weak var sliderView: UIView!
    var pageViewController: UIPageViewController!
    //var slides = [SliderInfo]()
    var slides = ["", "" , ""]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.restartAction(self)
        self.addChild(self.pageViewController)
        self.pageViewController.view.frame = self.sliderView.frame
        let views = [
            "pg": self.pageViewController.view
        ]
        for (_, v) in views {
            v!.translatesAutoresizingMaskIntoConstraints = false
            self.sliderView.addSubview(v!)
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
        return vc
    }
}
extension HomeSceneViewController: UIPageViewControllerDataSource {
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
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
