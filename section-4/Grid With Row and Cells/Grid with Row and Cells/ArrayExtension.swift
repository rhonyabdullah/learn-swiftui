//
//  ArrayExtension.swift
//  Grid with Row and Cells
//
//  Created by Rhony on 24/11/20.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            print("$0 : \($0) and $0 + size: \($0 + size) ")
            print("count: \(count)")
            print("Swift.min($0 + size, count): \(Swift.min($0 + size, count))")
            return Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
//    using size = 2, will print
//    $0 : 0 and $0 + size: 2
//     count: 10
//    Swift.min($0 + size, count): 2
//
//    $0 : 2 and $0 + size: 4
//     count: 10
//    Swift.min($0 + size, count): 4
//
//    $0 : 4 and $0 + size: 6
//     count: 10
//    Swift.min($0 + size, count): 6
//
//    $0 : 6 and $0 + size: 8
//     count: 10
//    Swift.min($0 + size, count): 8
//
//    $0 : 8 and $0 + size: 10
//     count: 10
//    Swift.min($0 + size, count): 10
}
