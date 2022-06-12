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
    
    private let dataStore = DataStore.shared
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
                    self.storeUserSignInStatus(loggedIn: true)
                    self.storeUser(userId: user.uid, userName: user.displayName, userEmail: user.email)
                    return
                }else {
                    self.log(msg: "user not logged in")
                    self.authState = .signedOut
                    self.storeUserSignInStatus(loggedIn: false)
                    return
                }
            }
        }
        
    }
    
    func checkSignInStatus() {
        if let user = Auth.auth().currentUser {
            log(msg: "user signed in \(user.displayName ?? "")")
            self.authState = .signedIn
            storeUserSignInStatus(loggedIn: true)
            storeUser(userId: user.uid, userName: user.displayName, userEmail: user.email)
        }else {
            log(msg: "user singned out")
            self.authState = .signedOut
            storeUserSignInStatus(loggedIn: false)
        }
    }
    
    func signOut() throws {
        GIDSignIn.sharedInstance.signOut()
        self.authState = .signedOut
        self.dataStore.eraseAllData()
        try Auth.auth().signOut()
    }
    
    private func storeUser(
        userId: String,
        userName: String?,
        userEmail: String?
    ) {
        dataStore.set(value: userId, key: dataStore.keys.userId)
        dataStore.set(value: userName ?? "", key: dataStore.keys.userName)
        dataStore.set(value: userEmail ?? "", key: dataStore.keys.userEmail)
    }
    
    private func storeUserSignInStatus(
        loggedIn: Bool
    ){
        dataStore.set(value: loggedIn, key: dataStore.keys.loggedIn)
    }
    
}

extension GoogleSignInAuthenticator {
    func log(msg: String){
        print("GoogleSignInAuthenticator: \(msg)")
    }
}
