//
//  ArrayExtension.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 16/12/22.
//

import Foundation

extension Array {
    func chunks(size: Int) -> [ArraySlice<Element>] {

        var chunks: [ArraySlice<Element>] = [ArraySlice<Element>]()

        for index in stride(from: 0, to: self.count, by: size) {
            
            var chunk = ArraySlice<Element>()
            let end = index + size
            if end >= self.count {
                chunk = self[index..<self.count]
            } else {
                chunk = self[index..<end]
            }

            chunks.append(chunk)

            if (end + 1) == self.count {
                let remainingChunk = self[end..<self.count]
                chunks.append(remainingChunk)
            }
        }

        return chunks
    }
    
    //size: 2
//    func chunks(size: Int) -> [ArraySlice<Element>] {
//
//        var chunks: [ArraySlice<Element>] = [ArraySlice<Element>]()
//
//        print("self.count: \(self.count) \n") //4
//        for index in stride(from: 0, to: self.count, by: size) {
//            var chunk = ArraySlice<Element>()
//            print("index: \(index)")
//            let end = index + size //2
//            print("end: \(end) \n")
//            if end >= self.count {
//                print("end >= self.count \n")
//                chunk = self[index..<self.count]
//            } else {
//                print("else \n")
//                chunk = self[index..<end]
//            }
//            print("chunk: \(chunk) \n")
//
//            chunks.append(chunk)
//
////            if (end + 1) == self.count {
////                print("end+1")
////                let remainingChunk = self[end..<self.count]
////                print("remainingChunk: \(remainingChunk)")
////                chunks.append(remainingChunk)
////            }
//        }
//
//        return chunks
//    }
}
