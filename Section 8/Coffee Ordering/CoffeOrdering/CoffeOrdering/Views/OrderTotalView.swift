//
//  OrderTotalView.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

struct OrderTotalView: View {

    let total: Double

    var body: some View {
        HStack {
            Spacer()
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OrderTotalView(total: 45.77).previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}
