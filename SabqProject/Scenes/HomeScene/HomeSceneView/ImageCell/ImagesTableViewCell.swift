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
    var cellIdentifier = String.imageCollectionCellIdentifier()
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
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
