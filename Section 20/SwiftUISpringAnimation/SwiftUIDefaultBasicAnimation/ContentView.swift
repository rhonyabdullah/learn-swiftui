//
//  ContentView.swift
//  SwiftUIDefaultBasicAnimation
//
//  Created by Mohammad Azam on 9/20/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            
            Button("Press me") {
                self.showDetails.toggle()
            }
            
            HStack {
                
                Text("🛬")
                    .font(.custom("Arial",size: 100))
                    .offset(x: self.showDetails ? UIScreen.main.bounds.width - 120 : 0)
                    .animation(.interpolatingSpring(mass: 5.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
                
                Spacer()
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
