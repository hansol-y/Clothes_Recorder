//
//  Clothes_RecorderApp.swift
//  Clothes Recorder
//
//  Created by Hansol Yang on 2023/04/28.
//

import SwiftUI

@main
struct Clothes_RecorderApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
