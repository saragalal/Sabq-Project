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
    var identifier = String.articleCollectionCellIdentifier()
    override func awakeFromNib() {
        super.awakeFromNib()
collectionView.register(UINib(nibName:identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        collectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    func configureCell(articles: [Materials?]?){
        articleAdaptor = ArticleCellAdaptor()
        articleAdaptor?.setAdaptor(collectionView: collectionView, reloadData: reloadCollectionView)
        articleAdaptor?.add(item: articles)
    }
    func reloadCollectionView(){
        collectionView.reloadData()
    }
}
