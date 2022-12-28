//
//  StringExtension.swift
//  SearchMovie
//
//  Created by Rhony Abdullah Siagian on 28/12/22.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
