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
            if ( item.imageBlurhashes?.backdrop.first != nil) {
                var blurhash = item.imageBlurhashes?.backdrop.first
                Image(uiImage: UIImage(blurHash: blurhash!.value, size: CGSize.init(width: 400, height: 200))!)
                    .clipped()
            } else {
                VStack {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    .background(Color.black)
            }
            VStack(alignment: .leading, spacing: 20) {
                if ((tag) != nil) {Text(tag!).font(.caption).padding(6.0).background(Color.green).clipShape(.buttonBorder)}
                if (item.parentName != nil) {
                    Text(item.parentName!).font(.largeTitle).bold()
                    Text(item.name).font(.callout).lineLimit(2).truncationMode(.tail)

                } else {
                    Text(item.name).font(.largeTitle).lineLimit(2).truncationMode(.tail)
                }
                
                if ((item.tagline) != nil) {Text(item.tagline!).font(.callout).lineLimit(2).truncationMode(.tail).bold()}
                if (item.itemType == .Movie || item.itemType == .Episode || item.itemType == .Video) {
                NavigationLink {
                    NowPlayingPage(item: item)
                } label: {
                    Label("Watch Now", systemImage: "play")
                        .buttonStyle(.glassProminent)
                }.buttonStyle(.glassProminent)
                    VStack(alignment: .trailing) {
                        if ((item.itemType == .Episode || item.itemType == .Video || item.itemType == .Movie) && item.userData?.playedPercentage != nil) {
                            VStack(alignment: .trailing) {
                                ProgressView(value: (item.userData?.playedPercentage!)! / 100).progressViewStyle(.linear)
                                    .frame(maxWidth: .infinity)
                                    .accentColor(.gray)
                            }

                            .font(.caption2).foregroundStyle(.gray)
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
