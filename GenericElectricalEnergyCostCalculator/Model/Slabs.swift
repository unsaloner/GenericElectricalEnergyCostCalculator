//
//  Slabs.swift
//  GenericElectricalEnergyCostCalculator
//
//  Created by Unsal Oner on 21.05.2023.
//

import Foundation


// Slab yapılandırması için Slab sınıfı
struct Slab {
    let range: Range<Int>
    let rate: Int
}

// Slab Tablosu range aralığı ayarlama.
let slabTable: [Slab] = [
    Slab(range: 1..<101, rate: 5),
    Slab(range: 101..<501, rate: 8),
    Slab(range: 500..<Int.max, rate: 10)
]
