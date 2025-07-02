//
//  BeRealTestApp.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//

import SwiftUI

@main
struct BeRealTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
