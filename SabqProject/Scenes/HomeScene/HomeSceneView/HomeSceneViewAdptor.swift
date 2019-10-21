//
//  HomeSceneViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class HomeSceneViewAdaptor :BaseViewAdaptorProtocal{
   
    typealias DataType = HomeMaterialResponse
    typealias AdaptorDelegate = HomeSceneViewController
    var data: HomeMaterialResponse?
    
    var delegate: HomeSceneViewController?
    
    var reloadData: (() -> Void)?
    func add(item: DataType){
        data = item
    }
    func count(name array: String) -> Int {
        if array == "slider"{
            if let count = data?.slider?.count{
                return count
            }
            return 0
        }else if array == "materials" {
            if let count = data?.materials?.count{
                return count
            }
            return 0
        }
        return 0
    }
    func clear(reload: Bool) {
        
    }
    
    func addFirstElememntInMaterial() {
   
    }
    func getItemInMaterialArray(at index: Int) -> Materials? {
        if let item = data?.materials?[index] {
            return item
        }
        else {
        return nil
        }
    }
    func getItemInSliderArray(at index: Int) -> Slider? {
        if let item = data?.slider?[index] {
            return item
        }
        else {
            return nil
        }
    }
}
