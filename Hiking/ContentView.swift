//
//  ContentView.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import SwiftUI

struct ContentView: View {

    let episode = Episode(name: "Mackbreak Weekly", track: "WWDC 2022")

    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.name)
                .font(.title)
                .foregroundColor(isPlaying ? .green : .black)

            Text(episode.track)
                .font(.title2)
                .foregroundColor(.secondary)

            PlayButton(isPlaying: $isPlaying)
        }
    }
}

struct PlayButton: View {

    @Binding internal var isPlaying: Bool

    var body: some View {
        Button(action: {
            isPlaying.toggle()
        }) {
            Text("Play")
        }.padding(8)
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
