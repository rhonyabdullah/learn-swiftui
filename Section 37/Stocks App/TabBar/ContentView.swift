//
//  ContentView.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 13/12/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var viewModel = StockListViewModel()

    var body: some View {
        List(viewModel.stocks, id: \.name) { stock in
            HStack {
                Text(stock.name)
                Spacer()
                Text(stock.price.formatted(.currency(code: "USD")))
            }
        }.refreshable {
            viewModel.getAllStocks(refresh: true)
        }.task {
            viewModel.getAllStocks()
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
