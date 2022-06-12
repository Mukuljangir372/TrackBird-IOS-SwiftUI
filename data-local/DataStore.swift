//
//  DataStore.swift
//  TrackBird
//
//  Created by Mukul Jangir on 12/06/22.
//

import Foundation
import UIKit

class DataStore {
    
    static let shared: DataStore = DataStore()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    let keys = DataStorekey.shared

    func set(value: Any?, key :String){
        userDefaults.set(value, forKey: key)
    }
    func get<T>(defaultValue: T, key: String) -> T{
        userDefaults.object(forKey: key) as? T ?? defaultValue
    }
    func eraseAllData(){
        var defaults = userDefaults.dictionaryRepresentation()
        defaults.removeAll()
    }
    
    //-------------------------- LOGGED IN USER ----------------------//
    func getUserId() -> String {
        get(defaultValue: "", key: keys.userId)
    }
    func getUserName() -> String {
        get(defaultValue: "", key: keys.userName)
    }
    func getUserEmail() -> String {
        get(defaultValue: "", key: keys.userMobile)
    }
    func loggedIn() -> Bool {
        get(defaultValue: false, key: keys.loggedIn)
    }
    
}
