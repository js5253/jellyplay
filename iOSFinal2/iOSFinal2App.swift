//
//  iOSFinal2App.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI
internal import CoreData

@main
struct iOSFinal2App: App {
    let jellyfinService = JellyfinService.shared
    @StateObject private var coreDataStack = CoreDataStack.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.persistentContainer.viewContext)
                .environmentObject(jellyfinService)

        }
    }
}
