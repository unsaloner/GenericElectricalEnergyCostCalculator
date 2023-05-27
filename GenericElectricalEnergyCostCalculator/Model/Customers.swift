//
//  Customers.swift
//  GenericElectricalEnergyCostCalculator
//
//  Created by Unsal Oner on 21.05.2023.
//

import UIKit
import Foundation


// Müşteri bilgilerini temsil eden Customer sınıfı
class Customer {
    var serviceNumber: String
    var previousReadings: [Int]
    
    init(serviceNumber: String) {
        self.serviceNumber = serviceNumber
        self.previousReadings = []
    }
    
    func calculateCost(currentReading: Int) -> Int {
        var totalCost = 0
        
        if let lastReading = previousReadings.last {
            let difference = currentReading - lastReading
            
            if difference > 0 {
                var remainingDifference = difference
                for slab in slabTable {
                    let slabRange = slab.range.lowerBound..<slab.range.upperBound
                    let slabUnits = min(remainingDifference, slabRange.count)
                    print(slabUnits)
                    totalCost += Int(slabUnits) * slab.rate
                    remainingDifference -= slabUnits
        
                    if remainingDifference <= 0 {
                        break
                    }
                }
            }
        } else {
            for slab in slabTable {
                let slabRange = slab.range.lowerBound..<min(slab.range.upperBound, currentReading)
                let slabUnits = slabRange.count
                totalCost += Int(slabUnits) * slab.rate
            }
        }
        
        return totalCost
    }

}







