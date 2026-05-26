//
//  ServerConfigResponse.swift
//  iOSFinal2
//
//  Created by jose on 5/20/26.
//

struct ServerConfigResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case localAddress = "LocalAddress"
        case version = "Version"
        case id = "Id"
    }
    let localAddress: String
    let version: String
    let id: String
}
