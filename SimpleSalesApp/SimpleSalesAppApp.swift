//
//  SimpleSalesAppApp.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 22/06/2024.
//

import SwiftUI
import RealmSwift

@main
struct SimpleSalesAppApp: SwiftUI.App {
    
    init() {
        // Set to false when the app used in production
        Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
