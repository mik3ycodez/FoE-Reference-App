//
//  GreatBuildings.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import Foundation

class GreatBuildings {
    
    private var _gbID: Int!
    private var _name: String!
    private var _gbAge: String!
    
    
    var gbID: Int {
        return _gbID
    }
    
    var name: String {
        return _name
    }
    
    var gbAge: String {
        return _gbAge
    }
    
    init(gbID: Int, name: String, gbAge: String) {
        
        self._gbID = gbID
        self._name = name
        self._gbAge = gbAge
    }
}
