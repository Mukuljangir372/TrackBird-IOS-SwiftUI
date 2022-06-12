//
//  ContentView.swift
//  TrackBird
//
//  Created by Mukul Jangir on 10/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        switch loginViewModel.authState {
        case .idle:
            ProgressView()
        case .signedIn:
            NavView()
        case .signedOut, .error:
            LoginView()
        }
    }
}

struct NavView: View {
    var body: some View {
        TabView {
            ExpenseListView()
                .tabItem({
                    HomeNavItems.expense
                })
                .tag(0)
            NoteListView()
                .tabItem({
                    HomeNavItems.notes
                })
                .tag(1)
        }
        .font(.headline)
    }
    

}

struct HomeNavItems {
    static let expense = Label(HomeNavLabel.expense.rawValue,
                               systemImage: "wallet.pass.fill")
    static let notes = Label(HomeNavLabel.notes.rawValue,
                             systemImage: "note")
}

enum HomeNavLabel: String {
    case expense = "Expenses"
    case notes = "Notes"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       NavView()
    }
}
