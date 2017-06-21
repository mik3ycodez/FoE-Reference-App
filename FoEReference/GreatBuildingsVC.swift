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
    var greatBuilding: GreatBuildings!
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        gbTableView.delegate = self
        gbTableView.dataSource = self
        
        self.navigationItem.title = "Great Buildings"
    }
    
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return greatBuilding.gbNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GBCell", for: indexPath) as! TableCells
        cell.gbCellLbl.text = greatBuilding.gbNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GBDetailsVC {
            if let gb = sender as? GreatBuildings {
                destination.greatBuilding = gb
            }
        }
    }
    
}
