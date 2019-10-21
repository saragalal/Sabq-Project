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
    var videoArray: [Comics?]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(videos: [Comics?]?){
        collectionView.register(UINib(nibName:"HomeVideosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        videoArray = videos
        collectionView.reloadData()
    }
}
extension HomeVideoTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = videoArray?.count {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVideosCollectionViewCell", for: indexPath) as? HomeVideosCollectionViewCell {
            cell.configureCell(item: videoArray?[indexPath.row])
            return cell
        }
        fatalError()
    }
}
extension HomeVideoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0.4*(collectionView.frame.size.width), height: 280)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
}
