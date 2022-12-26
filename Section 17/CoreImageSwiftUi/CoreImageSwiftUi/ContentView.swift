//
//  ContentView.swift
//  CoreImageSwiftUi
//
//  Created by Rhony Abdullah Siagian on 26/12/22.
//

import SwiftUI

struct ContentView: View {

    let images = ["cat", "gerape", "horse", "lion", "shark"]
    @State var selectedImage = ""

    @ObservedObject var viewModel: ImageDetectionViewModel

    init() {
        viewModel = ImageDetectionViewModel()
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(8)
                                .onTapGesture {
                                selectedImage = image
                            }.border(
                                Color(red: 200 / 255, green: 150 / 255, blue: 150 / 255),
                                width: selectedImage == image ? 3 : 0
                            )
                        }
                    }
                }.padding(.bottom, 16)

                Button("Detect Image") {
                    viewModel.detect(selectedImage)
                }.padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)

                Text(viewModel.predictionLabel)
                    .padding(.top, 16)

            }.navigationBarTitle("Core ML")
                .padding([.leading], 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
