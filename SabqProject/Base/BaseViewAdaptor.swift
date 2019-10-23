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
    var data: DataType? { get set}
    var reloadData:(() -> Void)? { get set}
    func count(name array: String) -> Int?
    func clear(reload: Bool)
    func add(item: DataType?)
}
