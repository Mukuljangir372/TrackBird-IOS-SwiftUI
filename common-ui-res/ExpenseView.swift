//
//  ExpenseView.swift
//  TrackBird
//
//  Created by Mukul Jangir on 12/06/22.
//

import SwiftUI

struct ExpenseView: View {
    
    let expense: Expense
    init(expense: Expense){
        self.expense = expense
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("\(expense.name)")
                    .font(.title3)
                Spacer()
                Text("\(String(format: "%.0f", expense.totalAmount)) \(expense.currenyText)")
                    .font(.body)
            }
            .lineLimit(5)
            .truncationMode(.tail)
    
            HStack {
                Text("\(expense.description)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(expense.updateAtDate)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(expense: Expense.preview[0])
            .preferredColorScheme(.light)
    }
}
