//
//  HomeTableViewCell.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit
import SDWebImage
class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    private var material: Materials?
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var numberLb: UILabel!
    @IBOutlet weak var bookmarkImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(item: Materials?){
        videoImage.isHidden = true
        if item != nil {
          material = item
          let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
          gestureRecognizer.numberOfTapsRequired = 1
          bookmarkImg.addGestureRecognizer(gestureRecognizer)
            if let urlString = item?.coverPhoto{
            imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "noimage.png"))
            }
            else {
                imgView.image = UIImage(named: "noimage.png")
            }
            titleLb.text = item?.title
            if let number = item?.noOfViews {
                numberLb.text = "\(number)"
            } else {
                numberLb.text = "\(0)"
            }
            if item?.videos?.count != 0 {
                videoImage.isHidden = false
            }
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("bookmark is tapped")
    }
}
