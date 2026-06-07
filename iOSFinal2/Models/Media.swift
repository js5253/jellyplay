//
//  Media.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

enum MediaType: Codable {
    case Episode, Show, Movie, Season, Video, Unknown
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
    var id: String
    let itemType: MediaType
    let description: String?
    init(from: JellyfinMediaItem) {
        self.name = from.name
        self.itemType = from.mediaType
        self.id = from.id;
        self.description = from.description;

    }
    init(name: String, itemType: MediaType, id: String) {
        self.name = name;
        self.id = id;
        self.itemType = itemType;
        self.description = nil
    }
    
    
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
    
    
    
    var backgroundImage: Image? {
        return nil
    }
    
}


struct JellyfinItemResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
    var items: [JellyfinMediaItem]
}

struct JellyfinMediaItem: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case description = "Description"
        case taglines = "Taglines"
        case mediaType = "MediaType"
    }
    var name: String
    var id: String
    var description: String?
    var taglines: [String]
    var mediaType: MediaType
}
