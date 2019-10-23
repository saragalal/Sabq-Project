//
//  SliderCellAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/23/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class SliderCellAdaptor: BaseViewAdaptorProtocal{
    var reloadData: (() -> Void)?
    
    typealias DataType = [Slider?]
    var data: [Slider?]?
    func count(name array: String) -> Int? {
        return data?.count
    }
    
    func clear(reload: Bool) {
        
    }
    
    func add(item: [Slider?]?) {
        self.data = item
    }
    
    func getItem(at index: Int) -> Slider?{
        return data?[index]
    }
    
}
