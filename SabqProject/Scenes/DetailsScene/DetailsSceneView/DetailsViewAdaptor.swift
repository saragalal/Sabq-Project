//
//  DetailsViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
class DetailsViewAdaptor: BaseViewAdaptorProtocal{
  
    typealias DataType = DetailsSceneModel
    typealias AdaptorDelegate = DetailsSceneViewController
    var list: [DetailsSceneModel]?
    var delegate: DetailsSceneViewController?
    var reloadData: (() -> Void)?
    
    func add(items: [DetailsSceneModel]?) {
        
    }
     func count() -> Int {
        return 0
    }
    func clear(reload: Bool) {
        
    }
}
