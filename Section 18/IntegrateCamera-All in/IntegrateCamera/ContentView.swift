//
//  ContentView.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 26/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil

    var body: some View {
        VStack(spacing: 16) {
            
            image?.resizable()
                .scaledToFit()
            
            Button("Open Camera") {
                showImagePicker = true
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(8)
            
        }.sheet(isPresented: $showImagePicker) {
            PhotoCaptureView(showImagePicker: $showImagePicker, image: $image)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
