//
//  Media.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

enum MediaType: String, Codable {
    case Episode, Movie, Season, Video, Unknown, Series, CollectionFolder, ManualPlaylistsFolder
}

struct ImageBlurhashes: Hashable, Codable {
    let backdrop: Dictionary<String, String>
}
struct MediaItem: Identifiable, Hashable, Codable {
    let name: String
    let parentName: String?
    var id: String
    let indexNumber: Int?
    let parentIndexNumber: Int?
    let itemType: MediaType
    let description: String?
    let tagline: String?
    let imageBlurhashes: ImageBlurhashes?
    var userData: UserData?

    init(from: JellyfinMediaItem) {
        self.name = from.name
        self.itemType = from.mediaType
        self.id = from.id;
        self.description = from.description
        self.tagline = from.taglines?.first
        self.imageBlurhashes = from.imageBlurhashes
        self.parentName = from.seriesName
        self.indexNumber = from.indexNumber
        self.parentIndexNumber = from.parentIndexNumber
        self.userData = from.userData

    }
    // this should only be used for testing.
    init(name: String, itemType: MediaType, id: String) {
        self.name = name;
        self.id = id;
        self.itemType = itemType;
        self.description = "A really long description that should be clipped at some point... But will it tho?????"
        self.imageBlurhashes = nil
        self.parentName = nil
        self.indexNumber = 1;
        self.parentIndexNumber = 1;
        self.userData = UserData(playedPercentage: 84.4, played: true, isFavorite: true)
        self.tagline = "The Best Damn Movie In The World..."
    }
    
    
}

struct JellyfinItemResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
    var items: [JellyfinMediaItem]
}

struct UserData: Codable, Equatable, Hashable {
    enum CodingKeys: String, CodingKey {
        case playedPercentage = "PlayedPercentage"
        case played = "Played"
        case isFavorite = "IsFavorite"
    }
    var playedPercentage: Float?
    var played: Bool?
    var isFavorite: Bool?
}
struct JellyfinMediaItem: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case description = "Overview"
        case taglines = "Taglines"
        case mediaType = "Type"
        case seriesName = "SeriesName"
        case indexNumber = "IndexNumber"
        case parentIndexNumber = "ParentIndexNumber"
        case userData = "UserData"
    }
    var userData: UserData?
    var name: String
    var id: String
    var seriesName: String?
    var indexNumber: Int?
    var parentIndexNumber: Int?
    var imageBlurhashes: ImageBlurhashes?
    var description: String?
    var taglines: [String]?
    var mediaType: MediaType
}
