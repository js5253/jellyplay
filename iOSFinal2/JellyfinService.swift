//
//  JellyfinService.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import Foundation
struct JellyfinService {
    static let shared = JellyfinService()
    
    func logIn() throws {
        
    }
    
    func isLoggedIn() -> Bool {
        let serverAddress = UserDefaults().string(forKey: "serverAddress");
        
        if (serverAddress == nil) {
            return false
        } else {
            return true
        }
    }
}
