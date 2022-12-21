//
//  CoffeOrderingApp.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import SwiftUI

@main
struct CoffeOrderingApp: App {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 165/255, green: 94/255, blue: 234/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
