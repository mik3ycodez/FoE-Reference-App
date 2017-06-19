//
//  GreatBuildingsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class GreatBuildingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var greatBuildings = [GreatBuildings]()
    //var greatBuildingsDict: Dictionary<Int, (String, String)>
    
    
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
        parseGreatBuildingsCSV()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return greatBuildings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GBCell", for: indexPath) as! TableCells
        //let gbTableEntry = greatBuildings[indexPath.row]
        cell.gbCellLbl.text = "place holder" // "place holder" should be gbTableEntry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
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
                //greatBuildingsDict[gbID] = name
                let greatBuilding = GreatBuildings(gbID: gbID, name: name, gbAge: gbAge)
                greatBuildings.append(greatBuilding)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        //print(greatBuildingsDict)
        //print(greatBuildings) // uncomment to debug
    }
    
}
