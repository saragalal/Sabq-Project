//
//  HomeSceneViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class HomeSceneViewAdaptor: NSObject, BaseViewAdaptorProtocal {
   
    typealias DataType = HomeMaterialResponse
    var data: HomeMaterialResponse?
    var videoArray: [Comics?]?
    var imageArray: [Comics?]?
    var articleArray: [Materials?]?
    var tableView: UITableView!
    var reloadData: (() -> Void)?
    var view: UIViewController!
    var identifier = ""
    var type = ""
    func setAdaptor(view: UIViewController, tableView: UITableView!, reloadData: (() -> Void)?) {
        self.tableView = tableView
        self.reloadData = reloadData
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view = view
    }
    func add(item: DataType?) {
        data = item
        reloadData?()
    }
    func sectionNumber() -> Int? {
        return 2
    }
    func count(name array: String) -> Int? {
        if array == String.slider() {
            if  !(data?.slider?.isEmpty ?? true) {
                return 1
            }
            return 0
        } else if array == String.materials() {
            if let count = data?.materials?.count {
                return count
            }
            return 0
        }
        return 0
    }
    func clear(reload: Bool) {
        
    }
    func getSlider() -> [Slider?]? {
        return data?.slider
    }
    func addElememntInMaterial(at index: Int, type: String) {
        let obj = Materials(type: type)
        data?.materials?.insert(obj, at: index)
    }
    func getItemInMaterialArray(at index: Int) -> Materials? {
        if let item = data?.materials?[index] {
            return item
        } else {
        return nil
        }
    }
    func addHomeResponse(response: HomeMaterialResponse?) {
        data = response
    }
    func addVideoArray(videos: [Comics?]?) {
        videoArray = videos
        addElememntInMaterial(at: 4, type: String.videos())
        reloadData?()
    }
    func addImagesArray(images: [Comics?]?) {
       imageArray = images
        addElememntInMaterial(at: 9, type: String.images())
        reloadData?()
    }
    func addArticleArray(articles: [Materials?]?) {
        articleArray = articles
        addElememntInMaterial(at: 14, type: String.articles())
        reloadData?()
    }
    func getVideoArray() -> [Comics?]? {
        return videoArray
    }
    func getImagesArray() -> [Comics?]? {
        return imageArray
    }
    func getArticlesArray() -> [Materials?]? {
        return articleArray
    }
}
extension HomeSceneViewAdaptor: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = self.sectionNumber() {
            return count
        }
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if let counts = self.count(name: String.slider()), counts != 0 {
                return counts
            }
            return 1
        } else {
            if let cellNumber = self.count(name: String.materials()), cellNumber != 0 {
                return cellNumber
            }
            return 2
        }
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if data == nil {
        return shimmerCells(indexPath: indexPath)
    } else {
        if indexPath.section == 0 {
            return sliderCell(indexPath: indexPath)
        } else {
            if let item = self.getItemInMaterialArray(at: indexPath.row) {
                if item.type == String.news() {
                    return newsCell(indexPath: indexPath, item: item)
                } else if item.type == String.videos() {
                    return videoCell(indexPath: indexPath)
                } else if item.type == String.images() {
                    return imagesCell(indexPath: indexPath)
                } else if item.type == String.articles() {
                    return articleCell(indexPath: indexPath)
                }
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: String.newsTableCellIdentifier(),
                                                            for: indexPath) as? HomeTableViewCell {
                    return cell
                }
            }
            fatalError("can't create cell")
        }
    }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if data == nil {
            if indexPath.section == 0 {
                return 400
            }
        } else {
        if indexPath.section == 0 {
            return 500
        }
        if indexPath.section == 1 {
            if let item = self.getItemInMaterialArray(at: indexPath.row) {
                if item.type == "video" {
                    return 0.8 * (self.view.view.frame.size.width)
                }
                if item.type == "image" {
                    return 0.8 * (self.view.view.frame.size.width)
                }
                if item.type == "article" {
                    return 0.8 * (self.view.view.frame.size.width)
                }
            }
          }
        }
        return UITableView.automaticDimension
    }
    private func sliderCell(indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String.sliderTableCellIdentifier(),
                                                    for: indexPath) as? SliderTableViewCell {
            if let sliderArray = self.getSlider() {
                cell.configureSliderCell(sliderArray: sliderArray)
            }
            return cell
        }
        fatalError("can't create cell")
    }
    private func newsCell(indexPath: IndexPath, item: Materials?) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String.newsTableCellIdentifier(),
                                                    for: indexPath) as? HomeTableViewCell {
            cell.configureCell(item: item)
            return cell
        }
        fatalError("can't create cell")
    }
    private func videoCell(indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            String.videoTableCellIdentifier(),
                                                    for: indexPath) as? HomeVideoTableViewCell {
            if let item = self.getVideoArray() {
                cell.configureCell(videos: item)
            }
            return cell
        }
        fatalError("can't create cell")
    }
    private func imagesCell(indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String.imageTableCellIdentifier(),
                                                    for: indexPath) as? ImagesTableViewCell {
            if let item = self.getImagesArray() {
                cell.configureCell(images: item)
            }
            return cell
        }
        fatalError("can't create cell")
    }
    private func articleCell(indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String.articleTableCellIdentifier(),
                                                    for: indexPath) as? ArticleTableViewCell {
            if let item = self.getArticlesArray() {
                cell.configureCell(articles: item)
            }
            return cell
        }
        fatalError("can't create cell")
    }
    private func shimmerCells(indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SliderShimmerCell",
                                                        for: indexPath) as? SliderShimmerCell {
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsShimmerCell",
                                                        for: indexPath) as? NewsShimmerCell {
                
                return cell
            }
        }
        fatalError("can't create cell")
    }
}
