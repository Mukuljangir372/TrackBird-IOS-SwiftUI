//
//  DataStoreKey.swift
//  TrackBird
//
//  Created by Mukul Jangir on 12/06/22.
//

import Foundation

class DataStorekey {
    static let shared = DataStorekey()
    private init() {}
    
    //-------------------------- LOGGED IN USER ----------------------//
    
    let userId: String = "USER_ID"
    let userName: String = "USER_NAME"
    let userEmail: String = "USER_EMAIL"
    let userMobile: String = "USER_MOBILE"
    let loggedIn: String = "loggedIn"
    
    
}
