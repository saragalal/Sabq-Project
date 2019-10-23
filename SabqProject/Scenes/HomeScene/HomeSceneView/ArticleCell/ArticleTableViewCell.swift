//
//  ArticleTableViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/22/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    private var articleAdaptor: ArticleCellAdaptor?
    var cellIdentifier = "ArticlesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    func configureCell(articles: [Materials?]?){
        articleAdaptor = ArticleCellAdaptor()
        articleAdaptor?.setAdaptor(collectionView: collectionView, reloadData: reloadCollectionView)
        articleAdaptor?.add(item: articles)
//        articlesArray = articles
//        collectionView.reloadData()
    }
    func reloadCollectionView(){
        collectionView.reloadData()
    }
}
extension ArticleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = articleAdaptor?.count(name: "article") {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ArticlesCollectionViewCell {
            if let item = articleAdaptor?.getItem(at: indexPath.row){
            cell.configureCell(item: item)
            }
            return cell
        }
        fatalError()
    }
}
extension ArticleTableViewCell: UICollectionViewDelegateFlowLayout {
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
