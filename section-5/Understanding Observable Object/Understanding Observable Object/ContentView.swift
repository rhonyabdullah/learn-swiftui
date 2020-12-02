//
//  ContentView.swift
//  Understanding Observable Object
//
//  Created by Rhony on 02/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fancyTimer = FancyTimer()
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            Text("Timer: \(fancyTimer.value)")
                .font(.largeTitle)
                .padding()
            Text("Score: \(userSettings.score)")
                .font(.largeTitle)
            Button("Increse Score") {
                self.userSettings.score += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
