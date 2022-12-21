//
//  OrderListView.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import SwiftUI

struct OrderListView: View {

    let orders: [OrderViewModel]

    init(orders: [OrderViewModel]) {
        self.orders = orders
    }

    var body: some View {
        VStack {
            List {
                ForEach(self.orders, id: \.id) { order in
                    HStack {
                        Image(order.coffee)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .cornerRadius(16)

                        VStack {
                            Text(order.name)
                                .font(.title)
                                .padding([.leading, .bottom], 10)
                                .multilineTextAlignment(.center)

                            HStack {
                                Text(order.coffee)
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .background(Color.gray)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)

                                Text(order.size)
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [
            OrderViewModel(
                order: Order(
                    name: "Jhon",
                    coffeeName: "Espresso",
                    total: 2.0,
                    size: "Medium"
                )
            )
            ])
    }
}
