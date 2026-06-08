

struct Library: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case childCount = "ChildCount"
//        case items = "Items"
//        case itemType = "ItemType"
    }
    var name: String
    var id: String
    var childCount: Int
//    var itemType: String
//    let items: [MediaItem]
    
}

struct LibraryResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
    var items: [Library]
}
