//
//  MainVC.swift
//  FoEReferrence
//
//  Created by cbeuser on 6/17/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    
    
    //MARK: - Variables
    var copiedMainTableEntries = [String]()
    
    private var _gatherDataMain: GatherData!
    
    var gatherDataMain: GatherData {
        get {
            return _gatherDataMain
        } set {
            _gatherDataMain = newValue
        }
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        copiedMainTableEntries = gatherDataMain.mainTableEntries
    }
    
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return copiedMainTableEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        let mainTableEntry = copiedMainTableEntries[indexPath.row]
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
}

