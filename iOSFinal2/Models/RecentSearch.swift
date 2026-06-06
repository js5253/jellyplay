//
//  RecentSearch.swift
//  iOSFinal2
//
//  Created by jose on 6/5/26.
//
enum SearchType {
    case media
    case term
}

struct RecentSearch: Identifiable {
    var type: SearchType
    var title: String
    var subtitle: String
    var id: String {title}

}

