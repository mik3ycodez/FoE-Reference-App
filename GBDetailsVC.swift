//
//  GBDetailsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/20/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import Foundation
import UIKit

class GBDetailsVC: UIViewController{
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var indexPassed: Int = 0
    var gbDetailIDs = [String]()
    var gbDetailNames = [String]()
    var gbDetailAges = [String]()
    
    override func viewDidLoad() {
        self.navigationItem.title = "\(gbDetailNames[indexPassed - 1])"
        self.navigationItem.leftBarButtonItem?.title = "Back"
        thumbImg.image = UIImage(named: "\(indexPassed)")
        nameLbl.text = gbDetailNames[indexPassed - 1]
    }
    
    
    
}
