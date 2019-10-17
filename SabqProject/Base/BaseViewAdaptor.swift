//
//  BaseViewAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation


protocol BaseViewAdaptorProtocal:class {
    associatedtype DataType
    associatedtype AdaptorDelegate where AdaptorDelegate:viewAdaptorDelegate
    var list: [DataType]? { get set}
    var delegate:AdaptorDelegate? { get set }
    var reloadData:(() -> Void)? { get set}
    func add(items: [DataType]?)
    func count() -> Int
    func clear(reload: Bool)
}
protocol viewAdaptorDelegate:class {
    
}
