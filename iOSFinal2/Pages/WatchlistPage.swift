//
//  Watchlist.swift
//  iOSFinal2
//
//  Created by jose on 5/20/26.
//
import SwiftUI

struct WatchlistPage: View {
    var body: some View {
        VStack {
            Text("Watchlist").font(.title)
            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
            
        }
    }
}

#Preview {
    WatchlistPage()
}
