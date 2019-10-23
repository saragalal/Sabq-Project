//
//  ImagesTableViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/22/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    private var imageAdaptor: ImageCellAdaptor?
    var cellIdentifier = "ImagesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        imageAdaptor = ImageCellAdaptor()
        imageAdaptor?.setAdaptor(collectionView: collectionView, reloadData: reloadCollectionView)
    }

    func configureCell(images: [Comics?]?){
         imageAdaptor?.add(item: images)
    }
    func reloadCollectionView(){
         collectionView.reloadData()
    }
}
extension ImagesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = imageAdaptor?.count(name: "image") {
            return number
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ImagesCollectionViewCell {
            if let item = imageAdaptor?.getItem(at: indexPath.row){
            cell.configureCell(item: item)
            }
            return cell
        }
        fatalError()
    }  
}
extension ImagesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0.75*(collectionView.frame.size.width), height: 0.8*(collectionView.frame.size.width))
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
}
