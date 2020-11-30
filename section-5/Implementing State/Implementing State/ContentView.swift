//
//  ContentView.swift
//  Implementing State
//
//  Created by Rhony on 30/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "No Name"

    var body: some View {
        VStack {
            Text(name)
                .padding()
                .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.name = "Lorem name"
            }
            , label: {
                Text("Change Name")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
