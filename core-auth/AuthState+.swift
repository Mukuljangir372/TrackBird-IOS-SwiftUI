//
//  AuthState+.swift
//  TrackBird
//
//  Created by Mukul Jangir on 11/06/22.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

enum AuthState {
    case idle
    case error
    case signedIn
    case signedOut
}
