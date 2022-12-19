//
//  HikingApp.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import SwiftUI

@main
struct HikingApp: App {
    
    @StateObject var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
