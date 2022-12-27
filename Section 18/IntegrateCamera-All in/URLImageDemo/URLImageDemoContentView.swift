//
//  URLImageDemoContentView.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//
import Foundation
import SwiftUI

struct URLImageDemoContentView: View {

    @State private var url: String = "https://comcomelectronics.com/wp-content/uploads/2022/08/apple-ios-2.jpg"
    private let placeHolder: String = "placeholder"

    @ObservedObject var imageLoader = ImageLoader()

    //test url = https://comcomelectronics.com/wp-content/uploads/2022/08/apple-ios-2.jpg

    var body: some View {
        VStack(spacing: 8) {
            TextField("Put url here", text: $url, axis: .vertical)
                .lineLimit(3...5)
                .foregroundColor(Color.cyan)
                .padding(.bottom, 16)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

            Button("Download image") {
                imageLoader.downloadImage(url: url)
            }.padding()
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(8)

            if let data = imageLoader.downloadData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding(.top, 16)
            } else {
                Image(placeHolder)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding(.top, 16)
            }
        }
    }
}

struct URLImageDemoContentView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageDemoContentView()
    }
}
