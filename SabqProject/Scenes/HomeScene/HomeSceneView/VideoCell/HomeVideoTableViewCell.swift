//
//  HomeVideoTableViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/21/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class HomeVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var cellIdentifier = String.videoCollectionCellIdentifier()
    private var videoAdaptor: VideoCellAdaptor?
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        videoAdaptor = VideoCellAdaptor()
        videoAdaptor?.setAdaptor(collectionView: collectionView,reloadData: reloadCollectionView)
    }
    
    func configureCell(videos: [Comics?]?){
       videoAdaptor?.add(item: videos)
    }
    func reloadCollectionView(){
        collectionView.reloadData()
    }
}
