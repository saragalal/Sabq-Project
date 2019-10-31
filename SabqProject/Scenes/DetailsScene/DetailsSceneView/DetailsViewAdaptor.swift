//
//  DetailsViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
class DetailsViewAdaptor: BaseViewAdaptorProtocal {
    typealias DataType = DetailsSceneModel
    typealias AdaptorDelegate = DetailsSceneViewController
    var data: DetailsSceneModel?
    var reloadData: (() -> Void)?
    func add(item: DataType?) {
        data = item
    }
    func count(name array: String) -> Int? {
        return 0
    }
   func clear(reload: Bool) {
     }
}
