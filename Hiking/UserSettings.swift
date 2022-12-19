//
//  UserSettings.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 19/12/22.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var score: Int = 0

    func increment() {
        self.score += 1
    }
}
