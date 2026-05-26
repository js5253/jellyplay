//
//  JellyfinService.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import Foundation
enum AppErrors: Error {
    case invalid
}
struct JellyfinService {
    static var shared: JellyfinService = {
        let serverAddress = UserDefaults().string(forKey: "serverAddress");
        if ((serverAddress) != nil) {
            return JellyfinService(serverAddress: serverAddress)
            
        } else {
            return JellyfinService(serverAddress: nil)
        }
        // setup code
        
    }()
    private let serverAddress: String?
    
    func getServerConfig(serverBase: String) async throws {
        let apiSuffix = "/System/Info/Public"
        let completeUrl = serverBase + apiSuffix
        print("Final URL: \(completeUrl)")
        
        do {
            let url = URL(string: completeUrl)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ServerConfigResponse.self, from: data)
            
            JellyfinService.shared = JellyfinService(serverAddress: serverBase)
            
        } catch {
            print(error)
        }
        
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
            let apiSuffix = "/Users/authenticatebyname"
            let completeUrl = serverAddress + apiSuffix
            print("Final URL: \(completeUrl)")
            
            
            let url = URL(string: completeUrl)!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("MediaBrowser Client=\"Jellyfin Web\", Device=\"Firefox\", DeviceId=\"TW96aWxsYS81LjAgKE1hY2ludG9zaDsgSW50ZWwgTWFjIE9TIFggMTAuMTU7IHJ2OjE1MC4wKSBHZWNrby8yMDEwMDEwMSBGaXJlZm94LzE1MC4wfDE3Nzk4MTE2NDQxODU1\", Version=\"10.11.10\"", forHTTPHeaderField: "Authorization")
            
            
            let body = ["Username": username, "Pw": password]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(ServerLoginResponse.self, from: data)
            
            print(decoded.accessToken)
            UserDefaults().set(username, forKey: "username")
            UserDefaults().set(password, forKey: "password")
            UserDefaults().set(serverAddress, forKey: "serverAddress")
            UserDefaults().set(decoded.accessToken, forKey: "accessToken")
            
        } catch {
            print(error)
        }
    }
    func serverBase() -> String {
        let serverAddress = UserDefaults().string(forKey: "serverAddress") ?? "";

        return serverAddress
    }
    
    func isLoggedIn() -> Bool {
        let serverAddress = UserDefaults().string(forKey: "serverAddress");
        
        return serverAddress != nil
        
    }
}
