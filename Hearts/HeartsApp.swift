//
//  HeartsApp.swift
//  Hearts
//
//  Created by James Norris on 05/01/2021.
//

import SwiftUI

@main
struct HeartsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
		WindowGroup {
			ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
