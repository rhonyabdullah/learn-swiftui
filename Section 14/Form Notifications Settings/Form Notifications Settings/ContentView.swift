//
//  ContentView.swift
//  Form Notifications Settings
//
//  Created by Rhony Abdullah Siagian on 22/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var testLbl: String = ""
    private var icons: [String] = ["👜", "🎒", "🥽", "🌂", "👟", "👚", "👔", "🧢", "🧤", "👒"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Shows Preview")
                        Spacer()
                        NavigationLink(destination: Text("NavigationLink Always")) {
                            Text("Always").foregroundColor(Color.gray)
                        }.fixedSize()
                    }
                }
                Section(header:
                        Text("Notification previews will be shown whether the iPhone is locked or unclocked")
                        .foregroundColor(Color.gray)
                        .offset(x: -16, y: 0)
                        .lineLimit(nil)
                        .textCase(.none)
                ) {
                    NavigationLink(destination: Text("Test Na")) {
                        Text("Siri Suggestion")
                    }
                }
                Section(header: VStack(alignment: .leading, spacing: 5) {
                        Text("Choose while apps can suggest shortcuts on the lock screen")
                            .lineLimit(nil)
                            .textCase(.none)
                            .offset(x: -16, y: 0)

                        Text("Notification Style")
                            .textCase(.uppercase)
                            .offset(x: -16, y: 0)
                    }) {
                        ForEach(icons, id: \.hashValue) { icon in
                            HStack {
                                Text(icon)
                                Text("Notification ")
                            }
                    }
                }
            }.navigationTitle("Notification")
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
