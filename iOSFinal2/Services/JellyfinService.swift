//
//  JellyfinService.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import Foundation
internal import Combine
enum AppErrors: Error {
    case invalid
    case notAuthenticatedError
}

final class JellyfinService: ObservableObject {
    static var shared = JellyfinService()
    
    private let serverAddress: String?
    private let userId: String?
    private var accessToken: String?
    private let deviceId: String?
    
    init() {
        let serverAddress = UserDefaults().string(forKey: "serverAddress");
        let userId = UserDefaults().string(forKey: "userId");
        let accessToken = UserDefaults().string(forKey: "accessToken");
        let deviceId = UserDefaults().string(forKey: "deviceId");
        
        self.serverAddress = serverAddress
        self.userId = userId
        self.accessToken = accessToken
        self.deviceId = deviceId
        isLoggedIn = serverAddress != nil
        
        ///TODO: validate that current token is used.
        
        isLoading = false
        
    }

    @Published var isLoggedIn: Bool = false
    
    // used as it's checking to make sure current token is authenticated.
    @Published var isLoading: Bool = true

    func getServerConfig(serverBase: String) async throws {
        let apiSuffix = "/System/Info/Public"
        let completeUrl = serverBase + apiSuffix
        print("Final URL: \(completeUrl)")
        
        do {
            let url = URL(string: completeUrl)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let _ = try JSONDecoder().decode(ServerConfigResponse.self, from: data)
            
        } catch {
            print(error)
        }
        
    }
    private func getAuthHeader() throws -> String {
        if (!isLoggedIn) {
            throw AppErrors.notAuthenticatedError
        }
        return "MediaBrowser Client=\"JellyPlay\", Device=\"iOS\", DeviceId=\"" + deviceId! + "\" Token=\"" + accessToken! + "\", Version=\"0.0.1\""

    }
    private func prepareAuthedRequest(apiSuffix: String, httpMethod: String) throws -> URLRequest {
        do {
            let completeUrl = serverAddress! + apiSuffix
            let url = URL(string: completeUrl)!
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(try getAuthHeader(), forHTTPHeaderField: "Authorization")
            
            return request;
        } catch {
            throw error
        }
    }
    func getLibraries() async throws -> [Library] {
        do {
            let req = try prepareAuthedRequest(apiSuffix: "/UserViews", httpMethod: "GET")

            let (data, _) = try await URLSession.shared.data(for: req)
            let decoded = try JSONDecoder().decode([Library].self, from: data)
            
            print(decoded)

        } catch  {
            print(error)
        }
        return []

    }
    func getWatchlist() {
        
    }
    func getLibrary(name: String) {
        
    }
    func getContinueWatching() async throws {
        do {
            if (!isLoggedIn) {
                throw AppErrors.notAuthenticatedError
            }
            let apiSuffix = "/Users/\(userId!)/Items/Resume?Limit=12&Recursive=true&Fields=PrimaryImageAspectRatio&ImageTypeLimit=1&EnableImageTypes=Primary,Backdrop,Thumb&EnableTotalRecordCount=false&MediaTypes=Video"
            let completeUrl = serverAddress! + apiSuffix
            
            let url = URL(string: completeUrl)!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(getAuthHeader(), forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let _ = try JSONDecoder().decode(ServerLoginResponse.self, from: data)
            

        } catch  {
            print(error)
        }

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
            let deviceId = UUID().uuidString
            
            let url = URL(string: completeUrl)!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(getAuthHeader(), forHTTPHeaderField: "Authorization")
            
            
            let body = ["Username": username, "Pw": password]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            request.setValue("MediaBrowser Client=\"JellyPlay\", Device=\"iOS\", DeviceId=\"" + (deviceId) + "\", Version=\"10.11.10\"", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            print(httpResponse.statusCode)
            if let textContent = String(data: data, encoding: .utf8) { // for debugging use
                print(textContent)
                    }

            let decoded = try JSONDecoder().decode(ServerLoginResponse.self, from: data)
            
            print(decoded.accessToken)
            UserDefaults().set(username, forKey: "username")
            UserDefaults().set(password, forKey: "password")
            UserDefaults().set(serverAddress, forKey: "serverAddress")
            UserDefaults().set(deviceId, forKey: "deviceId")
            UserDefaults().set(decoded.accessToken, forKey: "accessToken")
            
            accessToken = decoded.accessToken
            isLoggedIn = true
            
        } catch {
            print(error)
        }
    }
    func serverBase() -> String {
        let serverAddress = UserDefaults().string(forKey: "serverAddress") ?? "";

        return serverAddress
    }
    
}
