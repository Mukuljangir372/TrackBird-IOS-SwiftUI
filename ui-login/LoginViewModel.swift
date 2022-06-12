//
//  LoginViewModel.swift
//  TrackBird
//
//  Created by Mukul Jangir on 11/06/22.
//

import Foundation
import SwiftUI
import Combine
import GoogleSignIn
import FirebaseAuth
import Firebase

@MainActor
class LoginViewModel: ObservableObject {

    private var googleAuth: GoogleSignInAuthenticator
    
    @Published var authState : AuthState = .idle
    private var cancellables = Set<AnyCancellable>()

    init() {
        googleAuth = GoogleSignInAuthenticator()
        googleAuth.checkSignInStatus()
        
        googleAuth.$authState.sink { [weak self] newAuthState in
            self?.authState = newAuthState
        }
        .store(in: &cancellables)
    }
    
    func signIn(root: UIViewController) {
        googleAuth.signIn(rootViewController: root)
    }
    
    func signOut() {
        do {
            try googleAuth.signOut()
        }catch {
            log(msg: "failed to signout: \(error.localizedDescription)")
        }
    }
    
    private func log(msg: String) {
        print("LoginViewModel: \(msg)")
    }
}
