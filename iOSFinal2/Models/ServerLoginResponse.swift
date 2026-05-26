//
//  ServerLoginResponse.swift
//  iOSFinal2
//
//  Created by jose on 5/26/26.
//

struct ServerLoginResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case accessToken = "AccessToken"
    }
    let accessToken:  String
}
