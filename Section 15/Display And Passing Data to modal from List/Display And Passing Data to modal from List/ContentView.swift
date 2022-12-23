//
//  ContentView.swift
//  Display And Passing Data to modal from List
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var showModal: Bool = false
    @State private var selectedFlag: String = ""
    @State private var country: String = ""

    private let flags = ["🇦🇫", "🇨🇨", "🇱🇾", "🇪🇭", "🇦🇪"]

    var body: some View {
        VStack {
            Text("Selected country: \(country)")
                .multilineTextAlignment(.leading)
            List {
                ForEach(0..<self.flags.count, id: \.hashValue) { index in
                    HStack {
                        Text(flags[index])
                            .font(.custom("Arial", size: 50))
                        Text("Country is: \(index)")
                    }.onTapGesture {
                        selectedFlag = flags[index]
                        showModal.toggle()
                    }
                }
            }.sheet(isPresented: $showModal) {
                FlagDetailView(flag: selectedFlag, showModal: $showModal, country: $country)
        }
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
