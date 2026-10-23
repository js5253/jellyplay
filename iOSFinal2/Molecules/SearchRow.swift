//
//  SearchRow.swift
//  iOSFinal2
//
//  Created by jose on 6/5/26.
//
import SwiftUI
struct SearchRow : View {
    var title: String
    var subtitle: String?
    var mediaType: MediaType
    var body: some View {
        HStack(spacing: 18) {
                RoundedRectangle(cornerRadius: 8).frame(width: 60, height: 60)
                VStack {
                    Text(title)
                    Text(mediaType.rawValue).font(.caption)
                    if (subtitle != nil) {
                        Text(subtitle!).foregroundStyle(.gray).font(.caption)
                    }
                }
        }.padding()

    }
}
#Preview {
    SearchRow(title: "House M. D. (2006)", subtitle: "TV - Watchlisted", mediaType: .Episode)
}
