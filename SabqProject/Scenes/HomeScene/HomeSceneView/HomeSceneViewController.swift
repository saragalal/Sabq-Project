//
//  HomeSceneViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import Moya
class HomeSceneViewController: BaseViewController, HomeSceneViewProtocol ,viewAdaptorDelegate{
    //SectionOneSlider
    //ScetionThreeCollectionview
    @IBOutlet weak var homeTableView: UITableView!
    var results: HomeMaterialResponse?
    var videoResp: [Comics?]?
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: "SliderTableViewCell")
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
       homeTableView.register(UINib(nibName: "HomeVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeVideoTableViewCell")
        homeTableView.dataSource = self
        homeTableView.delegate = self
        self.homeTableView.estimatedRowHeight = 88.0
        self.homeTableView.rowHeight = UITableView.automaticDimension
        NetworkManager.shared.getHomePageMaterial(completion: { (result, status) in
            switch result {
            case .success(let response):
              self.results = response
              self.homeTableView.reloadData()
              NetworkManager.shared.getHomePageVideo { (result, status) in
                switch result {
                case .success(let response):
                    print(response)
                    self.videoResp = response.comics
                    if self.videoResp?.count != 0 {
                        let obj = Materials(type: "video")
                       
                        self.results?.materials?.insert(obj, at: 4)
                       
                        self.homeTableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                  }
                }
            case .failure(let error):
                print(error)
            }
            })
       
    }
}

extension HomeSceneViewController: UITableViewDataSource ,UITableViewDelegate{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if (results?.slider?.count) != nil {
            return 1
          }
        } else {
          if let cellNumber = results?.materials?.count {
          return cellNumber
        }
    }
         return 0
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell  = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as? SliderTableViewCell{
                if let sliderArray = results?.slider {
                cell.configureSliderCell(sliderArray: sliderArray)
              return cell
                }
            }
             fatalError()
        }
        else {
            if results?.materials?[indexPath.row]?.type == "news" {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell{
                    cell.configureCell(item: results?.materials?[indexPath.row])
                    return cell
                }
                fatalError()
           } else if results?.materials?[indexPath.row]?.type == "video" {
                if let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeVideoTableViewCell", for: indexPath) as? HomeVideoTableViewCell{
                    if videoResp != nil {
                  cell.configureCell(videos: videoResp)
                    }
                    return cell
                }
                 fatalError()
            }
            fatalError()
         }
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 520
        }
        if indexPath.section == 1{
            if results?.materials?[indexPath.row]?.type == "video" {
                return 300
            }
        }
        return UITableView.automaticDimension
    }
}
