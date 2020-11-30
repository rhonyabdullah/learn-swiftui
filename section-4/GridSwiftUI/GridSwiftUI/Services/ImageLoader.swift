//
//  ImageLoader.swift
//  GridSwiftUI
//
//  Created by Mohammad Azam on 6/13/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("URL is not defined!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            print(data)
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
        
    }
    
}
