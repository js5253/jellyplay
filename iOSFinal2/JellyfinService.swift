//
//  JellyfinService.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import Foundation
struct JellyfinService {
    static let shared: JellyfinService = {
        let serverAddress = UserDefaults().string(forKey: "serverAddress");
        if ((serverAddress) != nil) {
            return JellyfinService(serverAddress: serverAddress)

        } else {
            return JellyfinService(serverAddress: nil)
        }
        // setup code
        
    }()
    private let serverAddress: String?

    func getServerConfig() {
        
    }
    func getLibraries() {
        
    }
    func getWatchlist() {
        
    }
    func getLibrary(name: String) {
        
    }
    func randomLibraryItem() {
        
    }
    
    func search(query: String?, libraries: [String]) {
        
    }
    
    func logIn(serverAddress: String, username: String, password: String) async throws {
        do {
            let url = URL(string: "")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ServerConfigResponse.self, from: data)
            
            UserDefaults().set(username, forKey: "username")
            UserDefaults().set(password, forKey: "password")
            UserDefaults().set(serverAddress, forKey: "serverAddress")
        } catch {
            print(error)
        }
    }
    
    func isLoggedIn() -> Bool {
        let serverAddress = UserDefaults().string(forKey: "serverAddress");
        
        return serverAddress != nil
        
    }
}
