//
//  NewsShimmerCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/29/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class NewsShimmerCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
@IBOutlet private weak var newsImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        self.titleLabel.spacing = 8
        self.newsImageView.layer.cornerRadius = 5
    }

}
