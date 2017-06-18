//
//  AgesVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class AgesVC: UIViewController {
    
    private var _age: Ages!
    
    var age: Ages {
        get {
            return _age
        } set {
            _age = newValue
        }
    }
    
    override func viewDidLoad() {
        //set ui objects
        
        self.navigationItem.title = "Ages"
    }
    
}
