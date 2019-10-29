//
//  HomeSceneViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import Windless
class HomeSceneViewController: BaseViewController, HomeSceneViewProtocol {
    @IBOutlet weak private var homeTableView: UITableView!
    private var presenter: HomeScenePresenterProtocol?
    private var homeAdaptor: HomeSceneViewAdaptor?
    private var identifier = ""
    private lazy var shimmer = ShimmerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
homeTableView.register(UINib(nibName: "NewsShimmerCell",
                             bundle: nil), forCellReuseIdentifier: "NewsShimmerCell")
homeTableView.register(UINib(nibName: String.sliderTableCellIdentifier(),
                             bundle: nil), forCellReuseIdentifier: String.sliderTableCellIdentifier())
 homeTableView.register(UINib(nibName: String.newsTableCellIdentifier(),
                              bundle: nil), forCellReuseIdentifier: String.newsTableCellIdentifier())
 homeTableView.register(UINib(nibName: String.articleTableCellIdentifier(),
                              bundle: nil), forCellReuseIdentifier: String.articleTableCellIdentifier())
homeTableView.register(UINib(nibName: String.videoTableCellIdentifier(),
                             bundle: nil), forCellReuseIdentifier: String.videoTableCellIdentifier())
homeTableView.register(UINib(nibName: String.imageTableCellIdentifier(),
                             bundle: nil), forCellReuseIdentifier: String.imageTableCellIdentifier())
self.homeTableView.estimatedRowHeight = 120.0
self.homeTableView.rowHeight = UITableView.automaticDimension
homeAdaptor = HomeSceneViewAdaptor()
homeAdaptor?.setAdaptor(view: self, tableView: homeTableView, reloadData: reloadTableView)
        showLoading()
        reloadTableView()
        presenter?.viewDidLoad()
    }
    func setPresenter(presenter: HomeScenePresenter) {
        self.presenter = presenter
    }
    func addHomeResponse(response: HomeMaterialResponse?) {
        homeAdaptor?.add(item: response)
       hideLoading()
    }
    func addVideoArray(videos: [Comics?]?) {
        homeAdaptor?.addVideoArray(videos: videos)
    }
    func addImagesArray(images: [Comics?]?) {
        homeAdaptor?.addImagesArray(images: images)
    }
   func addArticleArray(articles: [Materials?]?) {
        homeAdaptor?.addArticleArray(articles: articles)

    }
      func reloadTableView() {
        self.homeTableView.reloadData()
    }
    override func showLoading() {
        homeTableView.windless.apply {
            $0.beginTime = 1
            $0.pauseDuration = 0.2
            $0.duration = 10
            $0.animationLayerOpacity = 0.7
        }
        .start()
//       shimmer.view.frame = self.view.frame
//         shimmer.view.start()
//        self.view.addSubview(shimmer.view)
        
       // shimmerView.isHidden = false
//        shimmerView.contentView = shimmer.view
//        shimmerView.isShimmering = true
//        shimmerView.shimmeringPauseDuration = 0.2
//        shimmerView.shimmeringAnimationOpacity = 0.5
//        shimmerView.shimmeringOpacity = 1.0
//        shimmerView.shimmeringSpeed = 230
//        shimmerView.shimmeringHighlightLength = 1.0
//        shimmerView.shimmeringDirection = .right
    }
    override func hideLoading() {
        homeTableView.windless.end()
//        shimmer.view.stop()
//        shimmer.view.removeFromSuperview()
        
//        shimmerView.isShimmering = false
//        shimmerView.isHidden = true
    }
    override func showErrorMessage(title: String?, message: String?) {
        print("\(String(describing: message))")
    }
}
