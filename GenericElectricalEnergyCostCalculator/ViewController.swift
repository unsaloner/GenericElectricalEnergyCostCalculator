//
//  ViewController.swift
//  GenericElectricalEnergyCostCalculator
//
//  Created by Unsal Oner on 21.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var serviceNumberTextField: UITextField!
    
    @IBOutlet weak var currentReadingTextField: UITextField!
    
    
    @IBOutlet weak var previousReadingsLabel: UILabel!
    
    
    @IBOutlet weak var calculatedCostLabel: UILabel!
    
    var customer: Customer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customer = Customer(serviceNumber: "")
        
    }
    
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        
        guard let serviceNumber = serviceNumberTextField.text, !serviceNumber.isEmpty else {
                    showAlert(message: "Please enter a valid service number.")
                    return
                }
                
                guard let currentReadingStr = currentReadingTextField.text, let currentReading = Int(currentReadingStr), currentReading >= 0 else {
                    showAlert(message: "Please enter a valid current reading.")
                    return
                }
                
                if !customer.serviceNumber.isEmpty && customer.serviceNumber != serviceNumber {
                    showAlert(message: "Invalid service number.")
                    return
                }
                
                if let lastReading = customer.previousReadings.last, currentReading < lastReading {
                    showAlert(message: "Current reading cannot be less than the previous reading.")
                    return
                }
                
                customer.serviceNumber = serviceNumber
        
        let cost = customer.calculateCost(currentReading: currentReading) 
                
                previousReadingsLabel.text = "Previous Readings: \(customer.previousReadings)"
                calculatedCostLabel.text = "Calculated Cost: $\(cost)"
                
                customer.previousReadings.append(currentReading)
                
                serviceNumberTextField.text = ""
                currentReadingTextField.text = ""

    }
//  Alert
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    
    
}

