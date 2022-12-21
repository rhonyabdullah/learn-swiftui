//
//  ContentView.swift
//  Bar Graph View
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

struct ContentView: View {

    let reports: [Report]

    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 5.0) {
            ForEach(reports, id: \.year) { report in
                BarView(report: report)
            }
        }
    }
}


#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(reports: Report.all())
        }
    }
#endif

struct BarView: View {

    let report: Report
    @State private var showGraph: Bool = false

    var body: some View {
        let value = report.revenue / 500
        let yValue = Swift.min(value * 20, 500)

        return VStack {
            Text(String(format: "$%.2f", report.revenue))
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: showGraph ? CGFloat(yValue) : 0.0)
                .onAppear { withAnimation(.default) {
                    showGraph = true
                }
            }
            Text(report.year)
        }
    }

}
