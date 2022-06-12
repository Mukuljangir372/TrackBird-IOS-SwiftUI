//
//  View+.swift
//  TrackBird
//
//  Created by Mukul Jangir on 11/06/22.
//

import SwiftUI
import Foundation

extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
    
}
