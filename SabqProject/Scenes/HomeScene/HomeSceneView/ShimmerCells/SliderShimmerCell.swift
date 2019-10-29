//
//  SliderShimmerCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/29/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class SliderShimmerCell: UITableViewCell {

    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var descriptionView: UIView!
    @IBOutlet weak private var titlLb2: UILabel!
    @IBOutlet weak private var titleLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       self.titleLb.spacing = 8
        self.imgView.layer.cornerRadius = 5
    }
}
