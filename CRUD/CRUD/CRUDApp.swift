//
//  CRUDApp.swift
//  CRUD
//
//  Created by quantumitservicesllp llp on 21/03/24.
//

import SwiftUI

@main
struct CRUDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
