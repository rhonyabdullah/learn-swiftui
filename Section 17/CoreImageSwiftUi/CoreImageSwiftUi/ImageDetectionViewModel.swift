//
//  ImageDetectionViewModel.swift
//  CoreImageSwiftUi
//
//  Created by Rhony Abdullah Siagian on 26/12/22.
//

import Foundation
import UIKit

class ImageDetectionViewModel: ObservableObject {
    
    var name: String = ""
    var manager: ImageDetectionManger
    
    private let defaultLabel: String = "Prediction image will be displayed here ..."
    
    @Published var predictionLabel: String = ""
    
    init() {
        manager = ImageDetectionManger()
        predictionLabel = defaultLabel
    }
    
    func detect(_ name: String) {
        //resize the image, resnet requirement
        let sourceImage = UIImage(named: name)
        
        guard let resizedImage = sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else {
            fatalError("Unable to resize the image")
        }
        
        if let label = manager.detect(image: resizedImage) {
            predictionLabel = label
        } else {
            predictionLabel = defaultLabel
        }
        
        
    }
    
}
