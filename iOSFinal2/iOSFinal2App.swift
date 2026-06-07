//
//  iOSFinal2App.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

@main
struct iOSFinal2App: App {
    let jellyfinService = JellyfinService.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(jellyfinService)

        }
    }
}
