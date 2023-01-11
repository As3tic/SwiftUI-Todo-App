//
//  ToProcrastinateApp.swift
//  ToProcrastinate
//
//  Created by Zerone Consulting on 11/01/23.
//

import SwiftUI

@main
struct ToProcrastinateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
