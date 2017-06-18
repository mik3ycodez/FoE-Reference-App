//
//  GatherData.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import Foundation

class GatherData {
    
    var mainTableEntries = [String]()
    var ages = [Ages]()
    var greatBuildings = [GreatBuildings]()
    var worlds = [Worlds]()
    
    func getMainTableEntries() {
        mainTableEntries = [
            "Worlds",
            "Ages",
            "Social",
            "Great Buildings",
            "Great Building Sniping",
            "Guild Expeditions (GE)",
            "Guild vs Guild (GVG)",
            "Tavern"
        ]
    }
    
    func parseAgesCSV() {
        let path = Bundle.main.path(forResource: "ages", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let ageID = Int(row["id"]!)!
                let name = row["name"]!
                let age = Ages(ageID: ageID, name: name)
                ages.append(age)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        //print(ages) // uncomment to debug
    }
    
    func parseGreatBuildingsCSV() {
        let path = Bundle.main.path(forResource: "greatbuildings", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let gbID = Int(row["id"]!)!
                let name = row["name"]!
                let gbAge = row["age"]!
                let greatBuilding = GreatBuildings(gbID: gbID, name: name, gbAge: gbAge)
                greatBuildings.append(greatBuilding)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        //print(greatBuildings) // uncomment to debug
    }
    
    func parseWorldsCSV() {
        let path = Bundle.main.path(forResource: "worlds", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let worldID = Int(row["id"]!)!
                let name = row["name"]!
                let world = Worlds(worldID: worldID, name: name)
                worlds.append(world)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        //print(worlds) // uncomment to debug
    }
    
}
