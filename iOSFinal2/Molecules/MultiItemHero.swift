internal import Combine
//
//  Hero.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct MultiItemHero: View {
    var items: [MediaItem]
    @State private var scrollPosition = ScrollPosition()
    @State private var x = 0
    @State private var timer = Timer.publish(
        every: 5.0,
        on: .main,
        in: .default
    ).autoconnect()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(items.enumerated()), id: \.offset) {
                        idx, item in
                        let backdropBlur = item.imageBlurhashes?.backdrop.values.first
                        ZStack {
                            if (backdropBlur != nil) {
                                Image(uiImage: UIImage(blurHash: backdropBlur!, size: CGSize.init(width: 400, height: 400))!)
                            }
                            VStack(alignment: .leading) {
                                if (item.parentName != nil) {
                                    VStack {
                                        Text(item.parentName!).font(.largeTitle).bold()
                                        Text(item.name).font(.title3)
                                    }
                                } else {
                                    Text(item.name).font(.largeTitle).bold()
                                }

                                if (item.tagline) != nil {
                                    Text(item.tagline!).font(.callout)
                                        .lineLimit(2).truncationMode(.tail)
                                }
                                HStack {
                                    NavigationLink {
                                        NowPlayingPage(item: item)
                                    } label: {
                                        Label("Watch Now", systemImage: "play")
                                    }.buttonStyle(.glass)
                                }
                            }
                        }.frame(height: 200.0)
                            .containerRelativeFrame(.horizontal) {
                            size,
                            axis in
                            size * 0.8

                        }
//                            .background(
//                                Gradient(colors: [randomColor(), randomColor()])
//                                    .opacity(
//                                        0.6
//                                    )
//                            )


                    }
                }

        }
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition($scrollPosition)
        .onReceive(timer) {
            _ in
            if x >= items.count {
                x = 0
            } else {
                x += 1
            }

        }
        .onChange(of: x) {
            withAnimation {
                scrollPosition.scrollTo(x: CGFloat(x * 290))
            }
        }
    }
}
#Preview {
    MultiItemHero(items: [
        MediaItem(name: "The Bee Movie", itemType: MediaType.Movie, id: "1"),
        MediaItem(name: "The LEGO Movie", itemType: .Series, id: "2"),
        MediaItem(name: "The Emoji Movie", itemType: .Movie, id: "3"),
        MediaItem(name: "CATS: The Movie", itemType: .Movie, id: "4"),
        MediaItem(name: "Love on a Leash", itemType: .Movie, id: "5"),
    ])
}
