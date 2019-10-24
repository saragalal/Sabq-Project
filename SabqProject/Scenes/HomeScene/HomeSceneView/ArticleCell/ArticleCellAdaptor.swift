//
//  ArticleCellAdaptor.swift
//  SabqProject
//
//  Created by sara.galal on 10/23/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class ArticleCellAdaptor: NSObject, BaseViewAdaptorProtocal{
    typealias DataType = [Materials?]
    var data: [Materials?]?
    var collectionView: UICollectionView!
    var reloadData: (() -> Void)?
    var cellIdentifier = String.articleCollectionCellIdentifier()
    func setAdaptor(collectionView: UICollectionView!,reloadData: (() -> Void)?){
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
    
    func add(item: [Materials?]?) {
        self.data = item
        reloadData?()
    }
    
    func getItem(at index: Int) -> Materials?{
        return data?[index]
    }
    
}
extension ArticleCellAdaptor: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = self.count(name: String.articles()) {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ArticlesCollectionViewCell {
            if let item = self.getItem(at: indexPath.row){
                cell.configureCell(item: item)
            }
            return cell
        }
        fatalError()
    }
}
extension ArticleCellAdaptor: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0.6*(collectionView.frame.size.width), height: 0.5*(collectionView.frame.size.width))
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
}
