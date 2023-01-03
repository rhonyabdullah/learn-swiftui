//
//  ContentView.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 13/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var searchTerm: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                VStack {
                    Text("Hello, SwiftUI!")
                        .foregroundColor(Color.white)

                }
            }.ignoresSafeArea()
                .navigationTitle(Text("Stocks"))
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
