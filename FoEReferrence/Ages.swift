//
//  Ages.swift
//  pokedex3
//
//  Created by cbeuser on 5/27/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import Foundation

class Ages {
    
    private var _ageID: Int!
    private var _name: String!
    
    
    var ageID: Int {
        return _ageID
    }
    
    var name: String {
        return _name
    }
    
    init(ageID: Int, name: String) {
        
        self._ageID = ageID
        self._name = name
    }
}
