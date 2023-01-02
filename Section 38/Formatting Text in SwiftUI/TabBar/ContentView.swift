//
//  ContentView.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 13/12/22.
//

import SwiftUI

struct ContentView: View {

    private let now = Date()
    private let distanceInMeters: Double = 1.0
    private let names = ["Jhon", "Alex", "Swift"]
    private let numbers = [0, 2, 4, 6, 7, 78]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Date Format")
                    .font(.body)
                    .textCase(.none)
                ) {
                    Text("formatted: \(now.formatted())")
                    Text("date omitted, time standard \(now.formatted(date: .omitted, time: .standard))")
                    Text("data long, time omitted: \(now.formatted(date: .long, time: .omitted))")

                    Text("day and month: \(now)")
                    VStack(alignment: .leading) {
                        Text("format style day:")
                        Text(now, format: Date.FormatStyle().day())
                    }
                    VStack(alignment: .leading) {
                        Text("format style day and month:")
                        Text(now, format: Date.FormatStyle().day().month())
                    }
                    VStack(alignment: .leading) {
                        Text("format style day and month two digit:")
                        Text(now, format: Date.FormatStyle().day().month(.twoDigits))
                    }
                }
                Section(header: Text("Distance Format")
                    .font(.body)
                    .textCase(.none)) {
                    //with bug
                    Text(distanceInMeters.convert(from: .meters, to: .centimeters).formatted())
                    //with extension func to resolve bug
                    Text(distanceInMeters.convert(from: .meters, to: .centimeters).format())
                }
                Section(header: Text("List Format")
                    .font(.body)
                    .textCase(.none)
                ) {
                    Text(names, format: .list(type: .and))
                    Text(numbers, format: .list(memberStyle: .number, type: .and))
                }
            }.navigationTitle(
                Text("Formatting Text")
            )
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Double {
    func convert(from: UnitLength, to: UnitLength) -> Measurement<UnitLength> {
        return Measurement(value: self, unit: from)
            .converted(to: to)
    }
}

//in some cases the measurement appear as ft (feet) when the default locale user device is set
//for ex: on US, to resolve this issue need another ext function that format the destination unit
extension Measurement {
    func format() -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter.string(from: self)
    }
}
