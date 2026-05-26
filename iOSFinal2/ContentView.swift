//
//  ContentView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

enum RootNavigationDestination {
    case loading, loginPage, homePage
    
}
struct RootLoggedInView: View {
    @State private var selectedTab: Tabs = .watchNow

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "play", value: .watchNow) {
                    HomePage()
                }
                Tab("Search", systemImage: "gear", value: .search) {
                    SearchPage()
                }
                Tab("Watchlist", systemImage: "gear", value: .watchlist) {
                    WatchlistPage()
                }
                Tab("Settings", systemImage: "gear", value: .settings) {
                    SettingsPage()
                }
            }
        }
    }
}


struct ContentView: View {
    @State var currentView: RootNavigationDestination;
//    @State var currentView: RootNavigationDestination = JellyfinService.shared.isLoggedIn() ? .homePage : .loading
    var body: some View {
        switch(currentView) {
        case .loading:
            ProgressView("Loading Data...")
        case .homePage:
            RootLoggedInView()
        case .loginPage:
            LoginPage()
        }
    }
}

        
    


#Preview {
    ContentView(currentView: .loginPage)
}
