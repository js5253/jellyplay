//
//  ServerLoginResponse.swift
//  iOSFinal2
//
//  Created by jose on 5/26/26.
//
struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
    }
    let id: String
}
struct ServerLoginResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case accessToken = "AccessToken"
        case user = "User"
    }
    let accessToken:  String
    let user: User
}
