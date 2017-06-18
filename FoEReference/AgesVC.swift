//
//  AgesVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class AgesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var ages = [Ages]()
    
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
        parseAgesCSV()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! TableCells
        //let ageTableEntry = mainTableEntries[indexPath.row]
        //cell.mainCellLbl.text = "place holder" // "place holder" should be ageTableEntry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    
}
