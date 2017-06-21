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
    
    private var _gbIDs = [String]()
    private var _gbNames = [String]()
    private var _gbAges = [String]()
    
    
    var gbID: Int {
        return _gbID
    }
    
    var name: String {
        return _name
    }
    
    var gbAge: String {
        return _gbAge
    }
    
    var gbIDs: [String] {
        return _gbIDs
    }
    
    var gbNames: [String] {
        return _gbNames
    }
    
    var gbAges: [String] {
        return _gbAges
    }
    
    init() {    //gbID: Int, name: String, gbAge: String, gbIDs: [String], gbNames: [String], gbAges: [String]
        
        self.parseGreatBuildingsCSV()
        
        self._gbID = gbID
        self._name = name
        self._gbAge = gbAge
        self._gbIDs = gbIDs
        self._gbNames = gbNames
        self._gbAges = gbAges
    }
    
    func parseGreatBuildingsCSV() {
        
        if let greatBuildingFilePath = Bundle.main.path(forResource: "greatbuildings", ofType: "csv") {
            if let gBContents = try? String(contentsOfFile: greatBuildingFilePath) {
                let lines = gBContents.components(separatedBy: "\n")
                
                for (index, line) in lines.enumerated() {
                    
                    if index >= 1 && index < lines.count - 1 {
                        let parts = line.components(separatedBy: ",")
                        let id = parts[0]
                        let name = parts[1]
                        let age = parts[2]
                        
                        let fixedAge = age.replacingOccurrences(of: "\r", with: "")
                        
                        _gbIDs.append(id)
                        _gbNames.append(name)
                        _gbAges.append(fixedAge)
                        
                    }
                    
                    
                }
            }
        }
        //        print(gbIDs)
        //        print(gbNames)
        //        print(gbAges)
    }
}
