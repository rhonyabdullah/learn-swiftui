//
//  ContentView.swift
//  Form Night Sift
//
//  Created by Rhony Abdullah Siagian on 22/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var scheduled: Bool = false
    @State private var manuallyEnableTillTomorrow: Bool = false
    @State private var colorTemperature: CGFloat = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header:
                        Text("Night Shift Automatically shift colors Night")
                        .padding(5)

                        .lineLimit(nil)
                        .textCase(.none)
                        .font(.title)
                ) {
                    Toggle(isOn: $scheduled) {
                        Text("Scheduled")
                    }

                    HStack {
                        VStack {
                            Text("From")
                            Text("To")
                        }
                        Spacer()
                        NavigationLink(destination: SunsetSunriseView()) {
                            VStack {
                                Text("Sunset")
                                    .foregroundColor(Color.blue)
                                Text("Sunrise")
                                    .foregroundColor(Color.blue)
                            }
                        }.fixedSize()
                    }
                }

                Section {
                    Toggle(isOn: $manuallyEnableTillTomorrow) {
                        Text("Manually Enable Until Tomorrow ")
                    }
                }

                Section(header: Text("Color Temperature")) {
                    HStack {
                        Text("Less Warm")
//                            .offset(y:-5.0) //to move the object upper
                        Slider(value: $colorTemperature)
                        Text("More Warm")
                    }
                }
                
                
            }
        }
    }
}

struct SunsetSunriseView: View {
    var body: some View {
        Text("Destination")
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
