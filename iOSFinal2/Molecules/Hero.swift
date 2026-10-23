//
//  Hero.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct Hero: View {
    var item: MediaItem
    var tag: String?
    
    var body: some View {
        ZStack {
            let blurhash: String? = nil
//            let blurhash = item.imageBlurhashes["Primary"]?.enumerated().first
            if let blurhash = blurhash {
                Image(uiImage: UIImage(blurHash: blurhash, size: CGSize.init(width: 400, height: 200))!)
                    .clipped()
                Text("Blurhash Item")
            } else {
                VStack {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    .background(Color.black)
            }
            VStack(alignment: .leading, spacing: 20) {
                if let tagline = item.tagline { Text(tagline).font(.caption).padding(6.0).background(Color.green).clipShape(.buttonBorder)
                }
                if let parentName = item.parentName {
                    Text(parentName).font(.largeTitle).bold()
                    Text(item.name).font(.callout).lineLimit(2).truncationMode(.tail)
                } else {
                    Text(item.name).font(.largeTitle).lineLimit(2).truncationMode(.tail)
                }
                
//                if let tagline = item.tagline {
//                    Text(tagline).font(.callout).lineLimit(2).truncationMode(.tail).bold()
//                }
                if (item.itemType == .Movie || item.itemType == .Episode || item.itemType == .Video) {
                NavigationLink {
                    NowPlayingPage(item: item)
                } label: {
                    Label("Watch Now", systemImage: "play")
                        .buttonStyle(.glassProminent)
                }.buttonStyle(.glassProminent)
                    VStack(alignment: .trailing) {
                        if (item.itemType == .Episode || item.itemType == .Video || item.itemType == .Movie) {
                            if let playedPercentage = item.userData?.playedPercentage {
                                VStack(alignment: .trailing) {
                                    ProgressView(value: playedPercentage / 100).progressViewStyle(.linear)
                                        .frame(maxWidth: .infinity)
                                        .accentColor(.gray)
                                }
                                
                                .font(.caption2).foregroundStyle(.gray)
                                
                            }
                        }
                            
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .foregroundStyle(.white)
        }
        .frame(height: 250.0)
    }
}
#Preview {
    
    Hero(item: MediaItem(name: "ASSASASA", itemType: .Series, id: "SASAASASSA"))
}
