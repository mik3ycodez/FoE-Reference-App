//
//  Worlds.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import Foundation

class Worlds {
    
    private var _worldID: Int!
    private var _name: String!
    
    
    var worldID: Int {
        return _worldID
    }
    
    var name: String {
        return _name
    }
    
    init(worldID: Int, name: String) {
        
        self._worldID = worldID
        self._name = name
    }
}
