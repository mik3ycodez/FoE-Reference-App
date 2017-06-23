//
//  AgesVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class AgesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var ageTableView: UITableView!
    
    var ageIDs = [String]()
    var ageNames = [String]()
    var ageForgePoints = [String]()
    var ageCoins = [String]()
    var ageSupplies = [String]()
    
    override func viewDidLoad() {
        parseAgesCSVWithoutCSVFile()
        
        ageTableView.delegate = self
        ageTableView.dataSource = self
        
        self.navigationItem.title = "Ages"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgeCell", for: indexPath) as! TableCells
        cell.ageCellLbl.text = ageNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func parseAgesCSVWithoutCSVFile() {
        
        if let greatBuildingFilePath = Bundle.main.path(forResource: "ages", ofType: "csv") {
            if let gBContents = try? String(contentsOfFile: greatBuildingFilePath) {
                let lines = gBContents.components(separatedBy: "\n")
                
                for (index, line) in lines.enumerated() {
                    
                    if index >= 1 && index < lines.count - 1 {
                        let parts = line.components(separatedBy: ",")
                        let id = parts[0]
                        let name = parts[1]
                        let forgePoints = parts[2]
                        let coins = parts[3]
                        let supplies = parts[4]
                        
                        let fixedSupplies = supplies.replacingOccurrences(of: "\r", with: "")
                        
                        ageIDs.append(id)
                        ageNames.append(name)
                        ageForgePoints.append(forgePoints)
                        ageCoins.append(coins)
                        ageSupplies.append(fixedSupplies)
                    }
                    
                    
                }
            }
        }
//        print(ageIDs)
//        print(ageNames)
//        print(ageForgePoints)
//        print(ageCoins)
//        print(ageSupplies)
    }
    
}
