//
//  GreatBuildingsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class GreatBuildingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gbTableView: UITableView!
    
    var gbIDs = [String]()
    var gbNames = [String]()
    var gbAges = [String]()
    
    override func viewDidLoad() {
        //set ui objects
        
        gbTableView.delegate = self
        gbTableView.dataSource = self
        
        self.navigationItem.title = "Great Buildings"
        parseGBCSVWithoutCSVFile()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gbNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GBCell", for: indexPath) as! TableCells
        cell.gbCellLbl.text = gbNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

    func parseGBCSVWithoutCSVFile() {
        
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
                        
                        gbIDs.append(id)
                        gbNames.append(name)
                        gbAges.append(fixedAge)
                    }
                    

                }
            }
        }
//        print(gbIDs)
//        print(gbNames)
//        print(gbAges)
    }
}
