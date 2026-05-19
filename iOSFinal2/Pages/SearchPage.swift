//
//  SettingsPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct SearchPage: View {
    @State() var searchText: String = ""
    @State private var selectedFlavor: Flavor = .chocolate
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("All Libraries").tag(Flavor.chocolate)
                    Text("Movies").tag(Flavor.vanilla)
                    Text("TV").tag(Flavor.strawberry)
                }
            }

            if searchText == "" {
                Text("Start typing above to find items").foregroundStyle(.gray)
            } else {

            }
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
