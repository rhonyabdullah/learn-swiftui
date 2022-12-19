//
//  ArrayExtension.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 16/12/22.
//

import Foundation

extension Array {

    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }

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

}
