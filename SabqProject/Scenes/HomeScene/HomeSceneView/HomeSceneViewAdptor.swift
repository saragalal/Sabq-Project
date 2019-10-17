//
//  HomeSceneViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class HomeSceneViewAdaptor :BaseViewAdaptorProtocal{
    typealias DataType = HomeSceneModel
    typealias AdaptorDelegate = HomeSceneViewController
    var list: [HomeSceneModel]?
    
    var delegate: HomeSceneViewController?
    
    var reloadData: (() -> Void)?
    
    func add(items: [HomeSceneModel]?) {
        
    }
    
    func count() -> Int {
      return 0
    }
    
    func clear(reload: Bool) {
        
    }
}
