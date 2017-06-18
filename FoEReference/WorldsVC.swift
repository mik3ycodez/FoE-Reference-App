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
    
    var worlds = [Worlds]()
    
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
        parseWorldsCSV()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worlds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorldCell", for: indexPath) as! TableCells
        //let worldTableEntry = worlds[indexPath.row]
        cell.worldCellLbl.text = "place holder" // "place holder" should be worldTableEntry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
