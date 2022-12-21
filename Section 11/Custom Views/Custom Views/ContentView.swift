//
//  ContentView.swift
//  Custom Views
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            
            Circle()
                .stroke(Color.green, style: StrokeStyle(lineWidth: 15))
                .padding([.top], 20)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 300)
                .padding([.top], 20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
