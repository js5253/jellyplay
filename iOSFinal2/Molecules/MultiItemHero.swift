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
            ZStack {
                HStack(alignment: .bottom) {
                    ForEach(items) {
                        _ in
                        Circle()
                            .fill(Color.white)
                            .frame(width: 16, height: 16)
                    }
                }.frame(height: 200.0)
                HStack {
                    ForEach(items) {
                        item in
                        VStack(alignment: .leading) {
                            if (item.tag) != nil {
                                Text(item.tag!).font(.caption).padding(4.0)
                                    .background(Color.green).clipShape(
                                        .buttonBorder
                                    )
                            }
                            Text(item.title).font(.largeTitle).bold()
                            if (item.subtitle) != nil {
                                Text(item.subtitle!).font(.callout).lineLimit(2)
                                    .truncationMode(.tail)
                            }

                            if (item.description) != nil {
                                Text(item.description!).font(.callout)
                                    .lineLimit(2).truncationMode(.tail)
                            }
                            HStack {
                                NavigationLink {
                                    MediaView(item: item)
                                } label: {
                                    Label("Watch Now", systemImage: "play")
                                }.buttonStyle(.glass)
//                                NavigationLink {
//                                    NowPlayingPage()
//                                } label: {
//                                    Label("More Details", systemImage: "info")
//                                }
                            }
                        }.frame(height: 200.0).containerRelativeFrame(
                            .horizontal
                        ) {
                            size,
                            axis in
                            size * 0.8

                        }
                            .background(
                                Gradient(colors: [randomColor(), randomColor()])
                                    .opacity(
                                        0.6
                                    )
                            )


                    }
                }
            }

        }
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
                scrollPosition.scrollTo(x: CGFloat(x * 260))
            }
        }
    }
}
#Preview {
    MultiItemHero(items: [
        MediaItem(name: "The Bee Movie"),
        MediaItem(name: "The LEGO Movie"),
        MediaItem(name: "The Emoji Movie"),
        MediaItem(name: "CATS: The Movie"),
        MediaItem(name: "Love on a Leash"),
    ])
}
