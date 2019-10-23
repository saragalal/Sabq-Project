//
//  VideoCellAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/23/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class VideoCellAdaptor: BaseViewAdaptorProtocal{
   typealias DataType = [Comics?]
     var data: [Comics?]?
    var collectionView: UICollectionView!
    var reloadData: (() -> Void)?
    func setAdaptor(collectionView: UICollectionView!,reloadData: (() -> Void)?){
        self.collectionView = collectionView
        self.reloadData = reloadData
    }
    func count(name array: String) -> Int? {
        return data?.count
    }
    
    func clear(reload: Bool) {
        
    }
    
    func add(item: [Comics?]?) {
        self.data = item
        reloadData?()
    }
    
    func getItem(at index: Int) -> Comics?{
        return data?[index]
    }
    
}
