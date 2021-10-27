//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Aljona Samuelsson on 2021-10-27.
//

import SwiftUI

@main
struct ToDoListAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
