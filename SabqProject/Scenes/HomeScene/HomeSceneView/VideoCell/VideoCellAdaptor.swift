//
//  VideoCellAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/23/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class VideoCellAdaptor: NSObject, BaseViewAdaptorProtocal {
   typealias DataType = [Comics?]
     var data: [Comics?]?
    var collectionView: UICollectionView!
    var reloadData: (() -> Void)?
    var cellIdentifier = String.videoCollectionCellIdentifier()
    func setAdaptor(collectionView: UICollectionView!, reloadData: (() -> Void)?) {
        self.collectionView = collectionView
        self.reloadData = reloadData
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
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
    
    func getItem(at index: Int) -> Comics? {
        return data?[index]
    }
    
}
extension VideoCellAdaptor: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = self.count(name: String.videos()) {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                         for: indexPath) as? HomeVideosCollectionViewCell {
            if let item = self.getItem(at: indexPath.row) {
                cell.configureCell(item: item)
            }
            return cell
        }
        fatalError("cant create cell")
    }
}
extension VideoCellAdaptor: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0.4 * (collectionView.frame.size.width),
                      height: 0.8 * (collectionView.frame.size.width))
    }
    
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
}
