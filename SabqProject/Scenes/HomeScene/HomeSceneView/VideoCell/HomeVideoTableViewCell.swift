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
    var cellIdentifier = "HomeVideosCollectionViewCell"
    private var videoAdaptor: VideoCellAdaptor?
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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
extension HomeVideoTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = videoAdaptor?.count(name: "video") {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HomeVideosCollectionViewCell {
            if let item = videoAdaptor?.getItem(at: indexPath.row){
            cell.configureCell(item: item)
            }
            return cell
        }
        fatalError()
    }
}
extension HomeVideoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0.4*(collectionView.frame.size.width), height: 0.8*(collectionView.frame.size.width))
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
}
