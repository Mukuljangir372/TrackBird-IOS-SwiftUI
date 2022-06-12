//
//  Expense.swift
//  TrackBird
//
//  Created by Mukul Jangir on 12/06/22.
//

import Foundation

struct Expense: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let totalItems: Int
    let totalAmount: Double
    let currency: Int
    let createdAt: Double
    let updateAt: Double
    let tagId: Int
    let categoryId: Int
 
    var createdAtDate: String {
        return getFormatDate(stamp: createdAt)
    }
    var updateAtDate: String {
        return getFormatDate(stamp: updateAt)
    }
    var currenyText: String {
        return CurrencyStore.shared.find(id: currency)?.symbol ?? ""
    }
    
}

extension Expense {
    
    func getFormatDate(stamp: Double) -> String {
        return DateUtils.shared.format(stamp: createdAt, format: DateFormat.DATE_MONTH_YEAR.rawValue)
    }
    
    static var preview: [Expense] {
        let expense = Expense(id: "1", name: "Home Expenses 🚗", description: "This is home expenses",
                             totalItems: 10,totalAmount: 100,currency: 1,createdAt: DateUtils.shared.timestamp,
                             updateAt: DateUtils.shared.timestamp, tagId: 0, categoryId: 0)
        return [expense, expense, expense,expense, expense, expense,expense, expense, expense]
    }
    
}
