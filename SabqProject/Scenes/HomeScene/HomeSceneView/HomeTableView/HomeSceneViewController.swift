//
//  HomeSceneViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import Moya
class HomeSceneViewController: BaseViewController, HomeSceneViewProtocol {
    @IBOutlet weak var homeTableView: UITableView!
    private var presenter: HomeScenePresenterProtocol?
    private var homeAdaptor: HomeSceneViewAdaptor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: "SliderTableViewCell")
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
       homeTableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        homeTableView.register(UINib(nibName: "HomeVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeVideoTableViewCell")
        homeTableView.register(UINib(nibName: "ImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "ImagesTableViewCell")
        homeTableView.dataSource = self
        homeTableView.delegate = self
        self.homeTableView.estimatedRowHeight = 88.0
        self.homeTableView.rowHeight = UITableView.automaticDimension
        homeAdaptor = HomeSceneViewAdaptor()
        homeAdaptor?.setAdaptor(tableView: homeTableView, reloadData: reloadTableView)
        presenter?.viewDidLoad()
    }
    func setPresenter(presenter: HomeScenePresenter){
        self.presenter = presenter
    }
    func addHomeResponse(response: HomeMaterialResponse?) {
        homeAdaptor?.add(item: response)
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
}

extension HomeSceneViewController: UITableViewDataSource ,UITableViewDelegate{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = homeAdaptor?.sectionNumber() {
          return count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if let count = homeAdaptor?.count(name: "slider"){
           return count
        }
            return 0

        } else {
          if let cellNumber = homeAdaptor?.count(name: "materials") {
          return cellNumber
        }
            return 0
    }
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell  = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as? SliderTableViewCell{
                if let sliderArray = homeAdaptor?.getSlider() {
                cell.configureSliderCell(sliderArray: sliderArray)
                }
                 return cell
            }
             fatalError()
        }
        else {
            if let item = homeAdaptor?.getItemInMaterialArray(at: indexPath.row){
             if item.type == "news" {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell{
                    cell.configureCell(item: item)
                    return cell
                }
                fatalError()
           } else if item.type == "video" {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeVideoTableViewCell", for: indexPath) as? HomeVideoTableViewCell{
                    if let item = homeAdaptor?.getVideoArray(){
                  cell.configureCell(videos: item)
                    }
                    return cell
                }
                 fatalError()
            } else if item.type == "image" {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "ImagesTableViewCell", for: indexPath) as? ImagesTableViewCell{
                     if let item = homeAdaptor?.getImagesArray() {
                        cell.configureCell(images: item)
                    }
                    return cell
                }
                fatalError()
            } else if item.type == "article" {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell{
                    if let item = homeAdaptor?.getArticlesArray() {
                        cell.configureCell(articles: item)
                    }
                    return cell
                }
                fatalError()
              }
            } else {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell{
                    return cell
                }
                
              }
             fatalError()
           }
      }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 510
        }
        if indexPath.section == 1{
            if let item = homeAdaptor?.getItemInMaterialArray(at: indexPath.row){
            if item.type == "video" {
                return 0.8*(self.view.frame.size.width)
            }
            if item.type == "image" {
                return 0.8*(self.view.frame.size.width)
            }
            if item.type == "article" {
                return 0.8*(self.view.frame.size.width)
            }
          }
        }
        return UITableView.automaticDimension
    }
}
