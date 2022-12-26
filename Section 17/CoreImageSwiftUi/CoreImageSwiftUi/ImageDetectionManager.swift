//
//  ImageDetectionManager.swift
//  CoreImageSwiftUi
//
//  Created by Rhony Abdullah Siagian on 26/12/22.
//

import Foundation
import CoreML
import UIKit

class ImageDetectionManger {

    let model: Resnet50

    init() {
        model = try! Resnet50(configuration: MLModelConfiguration())
    }

    func detect(image: UIImage) -> String? {
        guard let pixelBuffer = image.toCVPixelBuffer(),
        let prediction = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        return prediction.classLabel
    }

}
