//
//  ShimmerViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/24/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class ShimmerViewController: UIViewController {

    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    @IBOutlet weak var imgView5: UIImageView!
    @IBOutlet weak var imgView6: UIImageView!
    
    @IBOutlet weak var view10: UILabel!
    @IBOutlet weak var view9: UILabel!
    @IBOutlet weak var view8: UILabel!
    @IBOutlet weak var view7: UILabel!
    @IBOutlet weak var view6: UILabel!
    @IBOutlet weak var view5: UILabel!
    @IBOutlet weak var view4: UILabel!
    @IBOutlet weak var view3: UILabel!
    @IBOutlet weak var view2: UILabel!
    @IBOutlet weak var view1: UILabel!
    override func viewDidLoad() {
         super.viewDidLoad()
        self.img1.layer.masksToBounds = false
        self.img1.layer.cornerRadius = 10
        self.img1.clipsToBounds = true
        self.img2.layer.masksToBounds = false
        self.img2.layer.cornerRadius = 10
        self.img2.clipsToBounds = true
        self.imgView1.layer.masksToBounds = false
        self.imgView1.layer.cornerRadius = self.imgView1.frame.width/2
        self.imgView1.clipsToBounds = true
        self.imgView2.layer.masksToBounds = false
        self.imgView2.layer.cornerRadius = self.imgView1.frame.width/2
        self.imgView2.clipsToBounds = true
        self.imgView3.layer.masksToBounds = false
        self.imgView3.layer.cornerRadius = self.imgView1.frame.width/2
        self.imgView3.clipsToBounds = true
        self.imgView4.layer.masksToBounds = false
        self.imgView4.layer.cornerRadius = self.imgView1.frame.width/2
        self.imgView4.clipsToBounds = true
        self.imgView5.layer.masksToBounds = false
        self.imgView5.layer.cornerRadius = self.imgView1.frame.width/2
        self.imgView5.clipsToBounds = true
        self.imgView6.layer.masksToBounds = false
        self.imgView6.layer.cornerRadius = self.imgView1.frame.width/2
        self.imgView6.clipsToBounds = true
        self.view1.layer.masksToBounds = false
        self.view1.layer.cornerRadius = 10
        self.view1.clipsToBounds = true
        self.view2.layer.masksToBounds = false
        self.view2.layer.cornerRadius = 10
        self.view2.clipsToBounds = true
        self.view3.layer.masksToBounds = false
        self.view3.layer.cornerRadius = 10
        self.view3.clipsToBounds = true
        self.view4.layer.masksToBounds = false
        self.view4.layer.cornerRadius = 10
        self.view4.clipsToBounds = true
        self.view5.layer.masksToBounds = false
        self.view5.layer.cornerRadius = 10
        self.view5.clipsToBounds = true
        self.view6.layer.masksToBounds = false
        self.view6.layer.cornerRadius = 10
        self.view6.clipsToBounds = true
        self.view7.layer.masksToBounds = false
        self.view7.layer.cornerRadius = 10
        self.view7.clipsToBounds = true
        self.view8.layer.masksToBounds = false
        self.view8.layer.cornerRadius = 10
        self.view8.clipsToBounds = true
        self.view9.layer.masksToBounds = false
        self.view9.layer.cornerRadius = 10
        self.view9.clipsToBounds = true
        self.view10.layer.masksToBounds = false
        self.view10.layer.cornerRadius = 10
        self.view10.clipsToBounds = true
        
    }

}
