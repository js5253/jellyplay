//
//  MediaView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct Episode: Identifiable {
    var seasonId: Int
    var name: String
    var id: Int
    var description: String?

}

var episodes: [Episode] = [Episode(seasonId: 1, name: "Episode One", id: 1)]
struct MediaView: View {
    var item: MediaItem
    @State private var selectedFlavor: Flavor = .chocolate
    var body: some View {
        VStack {
            Hero(title: item.title)
            ScrollView {
                if (item.description != nil) {
                    Text(item.description!)
                }
                if (item.itemType == .Show) {
                    Picker("Season", selection: $selectedFlavor) {
                        Text("S1").tag(Flavor.chocolate)
                        Text("S2").tag(Flavor.vanilla)
                        Text("S3").tag(Flavor.strawberry)
                    }.pickerStyle(.segmented).fixedSize()
                    Text("13 Episodes").font(.title)
                    ForEach(episodes) {
                        episode in
                        HStack {
                            Image(systemName: "ASSASA")
                                .frame(height: 100.0)
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.lightGray))
                                .clipShape(.rect(cornerRadius: 6))
                            VStack {
                                Text("S\(episode.seasonId)E\(episode.id)").font(.caption).foregroundStyle(.gray)
                                Text(episode.name)
                                if episode.description != nil {
                                    Text(episode.description!)
                                }
                            }.frame(maxWidth: .infinity)
                            
                        }
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    MediaView(item: MediaItem(name: "The Bee Movie"))
}
