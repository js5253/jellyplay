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
    var body: some View {
        VStack {
            Text(title)
            if (subtitle != nil) {
                Text(subtitle!).font(.caption)
            }
        }.padding()

    }
}
#Preview {
    SearchRow(title: "House M. D. (2006)", subtitle: "TV - Watchlisted")
}
