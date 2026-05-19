//
//  SettingsPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI
struct SettingsPage: View {
    @State() var searchText: String = ""
    var body: some View {
        VStack {
            Text("Settings").font(.largeTitle)
            List {
                Button("Log Out", role: .destructive, action: {})
            }
        }
    }
}
#Preview {
    SettingsPage()
}
