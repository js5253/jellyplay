//
//  Media.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

enum MediaType: Codable {
    case Episode, Show, Movie, Season
}

protocol Mediable {
    var tag: String? {get}
    var title: String {get}
    var subtitle: String? {get}
    var description: String? {get}
    var backgroundImage: Image? {get}
    var itemType: MediaType {get}

}

struct MediaItem: Identifiable, Hashable, Codable {
    let name: String
//    let itemDescription: String?
    var id: String { name }
    var itemType: MediaType
}

extension MediaItem: Mediable {
    var tag: String? {
        return nil
    }
    
    var title: String {
        name
    }
    
    var subtitle: String? {
        name
    }
    
    var description: String? {
        name 
    }
    
    var backgroundImage: Image? {
        return nil
    }
    
}
init(from apiItem: JellyfinMediaItem) {
    
}

struct ContinueWatchingResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
    var items: [JellyfinMediaItem]
}

struct JellyfinMediaItem: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
    var name: String
}
