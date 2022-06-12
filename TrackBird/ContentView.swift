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
        case .error:
            Text("Something went wrong")
        case .signedIn:
            NavView()
        case .signedOut:
            LoginView()
        }
    }
}

struct NavView: View {
    var body: some View {
        TabView {
            ExpenseListView()
                .tabItem({
                    Label("Expenses", systemImage: "wallet.pass.fill")
                })
                .tag(0)
            NoteListView()
                .tabItem({
                    Label("Notes", systemImage: "note")
                })
                .tag(1)
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       NavView()
    }
}
