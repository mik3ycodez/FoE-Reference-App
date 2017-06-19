//
//  WorldsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class WorldsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var worldTableView: UITableView!
    
    var worldsDict = [Int: String]()
    
    override func viewDidLoad() {
        //set ui objects
        
        worldTableView.delegate = self
        worldTableView.dataSource = self
        
        self.navigationItem.title = "Worlds"
        parseWorldsCSV()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorldCell", for: indexPath) as! TableCells
        let worldTableEntry = worldsDict[indexPath.row + 1]
        cell.worldCellLbl.text = worldTableEntry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do something
    }
    
    
    func parseWorldsCSV() {
        let path = Bundle.main.path(forResource: "worlds", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let worldID = Int(row["id"]!)!
                let name = row["name"]!
                worldsDict[worldID] = name
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        print(worldsDict)

    }
    
}
