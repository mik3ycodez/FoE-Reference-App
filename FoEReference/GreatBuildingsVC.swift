//
//  GreatBuildingsVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/18/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class GreatBuildingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet weak var gbTableView: UITableView!
    
    
    //MARK: - Variables
    var gbIDs = [String]()
    var gbNames = [String]()
    var gbAges = [String]()
    var indexToPass = 0
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        parseGreatBuildingsCSV()
        
        gbTableView.delegate = self
        gbTableView.dataSource = self
        
        self.navigationItem.title = "Great Buildings"
    }
    
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gbNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GBCell", for: indexPath) as! TableCells
        cell.gbCellLbl.text = gbNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexToPass = indexPath.row + 1
        self.performSegue(withIdentifier: "SegueToGBDetailsVC", sender: self)
    }
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        if let destination = segue.destination as? GBDetailsVC {
            
            
            destination.indexPassed = indexToPass
            destination.gbDetailIDs = gbIDs
            destination.gbDetailNames = gbNames
            destination.gbDetailAges = gbAges
        }
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
