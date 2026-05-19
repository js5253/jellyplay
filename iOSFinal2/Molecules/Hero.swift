//
//  Hero.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct Hero: View {
    var tag: String?
    var title: String
    var subtitle: String?
    var description: String?
    var backgroundImage: Image?

    var body: some View {
        VStack(alignment: .leading) {
            if ((tag) != nil) {Text(tag!).font(.caption).padding(4.0).background(Color.green).clipShape(.buttonBorder)}
            Text(title).font(.largeTitle).bold()
            if ((subtitle) != nil) {Text(subtitle!).font(.callout).lineLimit(2).truncationMode(.tail)}

            if ((description) != nil) {Text(description!).font(.callout).lineLimit(2).truncationMode(.tail)}

        }.frame(maxWidth: .infinity)
            .frame(height: 200.0)
            .padding()
            .background(
                Gradient(colors: [.teal, .cyan, .white]).opacity(
                    0.6
                )
            )
    }
}
#Preview {
    Hero(tag: "Continue Watching", title: "Hello World!", subtitle: "S1E1: Pilot - 46m", description: "some long long long long long goln text some long long long long long goln text some long long long long long goln text some long long long long long goln text ")
}
