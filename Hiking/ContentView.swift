//
//  ContentView.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var settings = UserSettings()

    var body: some View {
        VStack {
            Text("Score: \(settings.score)")
                .font(.largeTitle)

            Button("Increment score") {
                settings.increment()
            }.padding(4)
        }
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
