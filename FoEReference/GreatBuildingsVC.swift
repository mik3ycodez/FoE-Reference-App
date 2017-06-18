//
//  GreatBuildingsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class GreatBuildingsVC: UIViewController {
    
    private var _greatBuilding: GreatBuildings!
    
    var greatBuilding: GreatBuildings {
        get {
            return _greatBuilding
        } set {
            _greatBuilding = newValue
        }
    }
    
    override func viewDidLoad() {
        //set ui objects
        
        self.navigationItem.title = "Great Buildings"
    }
    
}
