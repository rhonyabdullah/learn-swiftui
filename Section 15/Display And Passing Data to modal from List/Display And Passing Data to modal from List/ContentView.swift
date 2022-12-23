//
//  ContentView.swift
//  Display And Passing Data to modal from List
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import SwiftUI

struct ContentView: View {
    
    private let flags = ["🇦🇫", "🇨🇨", "🇱🇾", "🇪🇭", "🇦🇪"]
    @State private var viewModel = FlagViewModel()

    var body: some View {
        VStack {
            Text("Selected country: \(viewModel.country)")
                .multilineTextAlignment(.leading)
            List {
                ForEach(flags, id: \.hashValue) { flag in
                    HStack {
                        Text(flag)
                            .font(.custom("Arial", size: 50))
                        
                        Spacer()
                    
                    }.onTapGesture {
                        viewModel.flag = flag
                        viewModel.showModal.toggle()
                    }
                }
            }.sheet(isPresented: $viewModel.showModal) {
                FlagDetailView(viewModel: $viewModel)
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
