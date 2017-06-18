//
//  WorldsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class WorldsVC: UIViewController {
    
    private var _world: Worlds!
    
    var world: Worlds {
        get {
            return _world
        } set {
            _world = newValue
        }
    }
    
    override func viewDidLoad() {
        //set ui objects
        
        self.navigationItem.title = "Worlds"
        
    }
    
}
