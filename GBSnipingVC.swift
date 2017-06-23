//
//  GBSnipingVC.swift
//  FoEReference
//
//  Created by cbeuser on 6/22/17.
//  Copyright © 2017 CBE User. All rights reserved.
//

import UIKit
import Darwin

class GBSnipingVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var totalFPLbl: UITextField!
    @IBOutlet weak var currentGBLbl: UITextField!
    @IBOutlet weak var firstPlaceLbl: UITextField!
    @IBOutlet weak var calcBtn: UIButton!
    @IBOutlet weak var canYouLbl: UILabel!
    
    
    //MARK: - Variables
    var totalFP = 0.0
    var currentGBFP = 0.0
    var firstPlaceFP = 0.0
    var forgePointsToSnipe = 0.0
    var stringResult = ""
    
    
    //MARK: -
    override func viewDidLoad() {
        
    }
    
    func showErrorMessage(_ errorTitle: String, _ errorMessage: String) {
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        let calcResult = calculateSnipe()
        
        if calcResult != "" {
            if Double(calcResult)! > firstPlaceFP {
                canYouLbl.text = "Take first by adding \(stringResult) FPs!"
                canYouLbl.textColor = UIColor.green
            } else {
                canYouLbl.text = "You will not be able to take first."
                canYouLbl.textColor = UIColor.red
            }
        } else {
            canYouLbl.text = "Error"
            canYouLbl.textColor = UIColor.red
        }
        
    }
    
    func calculateSnipe() -> String {
        //Formula = (((totalFPLbl.text - currentGBLbl.text) - firstPlaceLbl.text) / 2 ) + firstPlaceLbl.text
        
        let errorTitle = "Empty Value"
        let errorMessage: String
        
        if totalFPLbl.text != "" {
            if currentGBLbl.text != "" {
                if firstPlaceLbl.text != "" {
                    //calculate
                    totalFP = Double(totalFPLbl.text!)!
                    currentGBFP = Double(currentGBLbl.text!)!
                    firstPlaceFP = Double(firstPlaceLbl.text!)!
                    
                    forgePointsToSnipe = ceil((((totalFP - currentGBFP) - firstPlaceFP) / 2 ) + firstPlaceFP)
                    stringResult = String(format: "%.0f", forgePointsToSnipe)
                    
                } else {
                    stringResult = ""
                    errorMessage = "Please enter a number into the last box."
                    showErrorMessage(errorTitle, errorMessage)
                }
            } else {
                stringResult = ""
                errorMessage = "Please enter a number into the middle box."
                showErrorMessage(errorTitle, errorMessage)
            }
        } else {
            stringResult = ""
            errorMessage = "Please enter a number into the top box."
            showErrorMessage(errorTitle, errorMessage)
        }
        
        return stringResult
        
    }
}
