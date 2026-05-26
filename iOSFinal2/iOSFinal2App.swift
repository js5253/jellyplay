//
//  iOSFinal2App.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

@main
struct iOSFinal2App: App {
    var currentView = JellyfinService.shared.isLoggedIn() ? RootNavigationDestination.homePage : RootNavigationDestination.loginPage
    var body: some Scene {
        WindowGroup {
            ContentView(currentView: currentView)
        }
    }
}
