//
//  ImageLoader.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import Foundation

class ImageLoader: ObservableObject {

    @Published var downloadData: Data?

    func downloadImage(url: String) {

        guard let imageUrl = URL(string: url) else {
            return
        }

        URLSession.shared.dataTask(
            with: imageUrl,
            completionHandler: onImageTaskCompleted
        ).resume()

    }

    private func onImageTaskCompleted(data: Data?, response: URLResponse?, error: Error?) {
        guard let data = data, error == nil else {
            return
        }
        DispatchQueue.main.async {
            self.downloadData = data
        }
    }

}
