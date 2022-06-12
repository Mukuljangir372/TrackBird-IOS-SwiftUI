//
//  TrackBirdApp.swift
//  TrackBird
//
//  Created by Mukul Jangir on 10/06/22.
//

import SwiftUI
import FirebaseAuth

@main
struct TrackBirdApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var loginViewModel = LoginViewModel()
   
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(self.loginViewModel)
        }
    }
}
