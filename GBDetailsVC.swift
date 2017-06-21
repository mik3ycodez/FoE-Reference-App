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
    
    private var _greatBuilding: GreatBuildings!
    
    var greatBuilding: GreatBuildings {
        get {
            return _greatBuilding
        } set {
            _greatBuilding = newValue
        }
    }
    
    
    
}
