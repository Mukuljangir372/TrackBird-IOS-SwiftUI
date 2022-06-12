//
//  GoogleSignInAuthenticator.swift
//  TrackBird
//
//  Created by Mukul Jangir on 11/06/22.
//

import Foundation
import GoogleSignIn
import Firebase

@MainActor
class GoogleSignInAuthenticator: ObservableObject {
    
    @Published var authState: AuthState = .idle
    
    func signIn(rootViewController: UIViewController) {
        guard let clientId = FirebaseApp.app()?.options.clientID else {
            log(msg: "failed to get firebase app client id")
            self.authState = .error
            return
        }
        let config = GIDConfiguration(clientID: clientId)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: rootViewController){ user, error in
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                self.log(msg: "failed to get user auth and token")
                self.authState = .error
                return
            }
            
            let creds = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
          
            //Firebase auth
            Auth.auth().signIn(with: creds) { result, error in
                if let error = error {
                    self.log(msg: "\(error.localizedDescription)")
                    self.authState = .error
                    return
                }
                if let user = result?.user {
                    self.log(msg: "user logged in : \(user.displayName ?? "name not found")")
                    self.authState = .signedIn
                    return
                }else {
                    self.log(msg: "user not logged in")
                    self.authState = .signedOut
                    return
                }
            }
        }
        
    }
    
    func checkSignInStatus() {
        if let user = Auth.auth().currentUser {
            self.authState = .signedIn
            log(msg: "user signed in \(user.displayName ?? "")")
        }else {
            self.authState = .signedOut
            log(msg: "user singned out")
        }
    }
    
    func signOut() throws {
        GIDSignIn.sharedInstance.signOut()
        self.authState = .signedOut
        try Auth.auth().signOut()
    }
    
}

extension GoogleSignInAuthenticator {
    func log(msg: String){
        print("GoogleSignInAuthenticator: \(msg)")
    }
}
