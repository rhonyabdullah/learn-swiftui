//
//  FancyTimer.swift
//  Understanding Observable Object
//
//  Created by Rhony on 02/12/20.
//

import Combine
import Foundation

class FancyTimer: ObservableObject {
    @Published var value: Int = 0

    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.value += 1
        }
    }
}
