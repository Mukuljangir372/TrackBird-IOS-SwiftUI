//
//  ExpenseListView.swift
//  TrackBird
//
//  Created by Mukul Jangir on 11/06/22.
//

import SwiftUI

struct ExpenseListView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List(Expense.preview,id: \.id){ expense in
                    ExpenseView(expense: expense)
                }
            }
            .refreshable { }
            .navigationTitle(HomeNavLabel.expense.rawValue)
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
