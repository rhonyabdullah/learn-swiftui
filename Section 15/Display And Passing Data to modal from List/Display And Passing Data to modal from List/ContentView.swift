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
    
    private let flags = ["🇦🇫", "🇨🇨", "🇱🇾", "🇪🇭", "🇦🇪"]
    
    var body: some View {
        List {
            ForEach(0..<self.flags.count, id:\.hashValue) { index in
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
            Text(selectedFlag)
                .font(.custom("Arial", size: 200))
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
