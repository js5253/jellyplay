//
//  SettingsPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI
struct SearchPage: View {
    @State() var searchText: String = ""
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
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
        .padding()
        .textFieldStyle(.roundedBorder)
    }
        
}
#Preview {
    SearchPage()
}
