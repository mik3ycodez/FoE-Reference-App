//
//  MainVC.swift
//  FoEReferrence
//
//  Created by cbeuser on 6/17/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    
    
    //MARK: - Outlets
    
    
    
    //MARK: - Variables
    var mainTableEntries = [String]()
    var ages = [Ages]()
    var greatBuildings = [GreatBuildings]()
    var worlds = [Worlds]()
    
    
    //MARK: - Constants
    
    
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getMainTableEntries()
        parseAgesCSV()
        parseGreatBuildingsCSV()
        parseWorldsCSV()
    }
    
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTableEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        let mainTableEntry = mainTableEntries[indexPath.row]
        cell.mainCellLbl.text = mainTableEntry
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("SegueToWorldsVC")
            self.performSegue(withIdentifier: "SegueToWorldsVC", sender: self)
        case 1:
            print("SegueToAgesVC")
            self.performSegue(withIdentifier: "SegueToAgesVC", sender: self)
        case 2:
            print("SegueToSocialsVC")
            self.performSegue(withIdentifier: "SegueToSocialsVC", sender: self)
        case 3:
            print("SegueToGreatBuildingsVC")
            self.performSegue(withIdentifier: "SegueToGreatBuildingsVC", sender: self)
        case 4:
            print("SegueToGBSnipingsVC")
            self.performSegue(withIdentifier: "SegueToGBSnipingsVC", sender: self)
        case 5:
            print("SeguesToGEsVC")
            self.performSegue(withIdentifier: "SeguesToGEsVC", sender: self)
        case 6:
            print("SegueToGVGsVC")
            self.performSegue(withIdentifier: "SegueToGVGsVC", sender: self)
        case 7:
            print("SegueToTavernsVS")
            self.performSegue(withIdentifier: "SegueToTavernsVS", sender: self)
        default:
            print("Did not segue")
        }
        
    }
    
    
    //MARK: - Obtain Data
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

