//
//  Currency.swift
//  TrackBird
//
//  Created by Mukul Jangir on 12/06/22.
//

import Foundation

struct CurrencyStore {
    static let shared = CurrencyStore()
    private init() {}
    
    let getAll = [Currency(id: 1,symbol: "₹"), Currency(id: 2, symbol: "$")]
    
    func find(id: Int) -> Currency? {
        return getAll.first(where: {$0.id == id})
    }
    
    func getRupeeCurrency() -> Currency {
        return getAll[0]
    }
    func getDollarCurrency() -> Currency {
        return getAll[1]
    }
}

struct Currency: Codable, Identifiable {
    let id: Int
    let symbol: String
}

