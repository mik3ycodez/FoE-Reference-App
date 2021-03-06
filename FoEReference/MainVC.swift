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
    var mainTableEntries = [String]()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "red_fabric_background2.jpg"))
        
        
        getMainTableEntries()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            scrollView.contentOffset = CGPoint.zero
        }
    }
    
//    scrollViewDidScroll:(UIScrollView *)scrollView
//    {
//    if (scrollView.contentOffset.y<=0) {
//    scrollView.contentOffset = CGPointZero;
//    }
//    }
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTableEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! TableCells
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
            //self.performSegue(withIdentifier: "SegueToSocialsVC", sender: self)
        case 3:
            print("SegueToGreatBuildingsVC")
            self.performSegue(withIdentifier: "SegueToGreatBuildingsVC", sender: self)
        case 4:
            print("SegueToGBSnipingVC")
            self.performSegue(withIdentifier: "SegueToGBSnipingVC", sender: self)
        case 5:
            print("SeguesToGEsVC")
            //self.performSegue(withIdentifier: "SeguesToGEsVC", sender: self)
        case 6:
            print("SegueToGVGsVC")
            //self.performSegue(withIdentifier: "SegueToGVGsVC", sender: self)
        case 7:
            print("SegueToTavernsVS")
            //self.performSegue(withIdentifier: "SegueToTavernsVS", sender: self)
        default:
            print("Did not segue")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    
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
    
}

