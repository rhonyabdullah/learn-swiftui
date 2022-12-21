//
//  Bar_Graph_ViewApp.swift
//  Bar Graph View
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

@main
struct Bar_Graph_ViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(reports: Report.all())
        }
    }
}
