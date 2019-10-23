//
//  HomeSceneViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class HomeSceneViewAdaptor :BaseViewAdaptorProtocal{
   
    typealias DataType = HomeMaterialResponse
    var data: HomeMaterialResponse?
    var videoArray: [Comics?]?
    var imageArray: [Comics?]?
    var articleArray: [Materials?]?
     var tableView: UITableView!
    var reloadData: (() -> Void)?
    func setAdaptor(tableView: UITableView!, reloadData: (() -> Void)?){
        self.tableView = tableView
        self.reloadData = reloadData
    }
    func add(item: DataType?){
        data = item
        reloadData?()
    }
    func sectionNumber() -> Int?{
        return 2
    }
    func count(name array: String) -> Int? {
        if array == "slider"{
            if  data?.slider?.count != 0{
                return 1
            }
            return 0
        } else if array == "materials" {
            if let count = data?.materials?.count{
                return count
            }
            return 0
        }
        return 0
    }
    func clear(reload: Bool) {
        
    }
    func getSlider() -> [Slider?]?{
        return data?.slider
    }
    func addElememntInMaterial(at index: Int, type: String) {
        let obj = Materials(type: type)
        data?.materials?.insert(obj, at: index)
    }
    func getItemInMaterialArray(at index: Int) -> Materials? {
        if let item = data?.materials?[index] {
            return item
        }
        else {
        return nil
        }
    }
    func addHomeResponse(response: HomeMaterialResponse?){
        data = response
    }
    func addVideoArray(videos: [Comics?]?){
        videoArray = videos
        addElememntInMaterial(at: 4, type: "video")
        reloadData?()
    }
    func addImagesArray(images: [Comics?]?){
       imageArray = images
        addElememntInMaterial(at: 9, type: "image")
        reloadData?()
    }
    func addArticleArray(articles: [Materials?]?){
        articleArray = articles
        addElememntInMaterial(at: 14, type: "article")
        reloadData?()
    }
    func getVideoArray() -> [Comics?]?{
        return videoArray
    }
    func getImagesArray() -> [Comics?]?{
        return imageArray
    }
    func getArticlesArray() -> [Materials?]?{
        return articleArray
    }
}
