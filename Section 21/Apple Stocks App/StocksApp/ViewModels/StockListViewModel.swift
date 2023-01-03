//
//  StockListViewModels.swift
//  StocksApp
//
//  Created by Rhony Abdullah Siagian on 02/01/23.
//

import Foundation

class StockListViewModel: ObservableObject {

    private let service = WebService()

    var searchTerm = ""
    @Published var stocks = [StockViewModel]()

    func load() {
        fetchStocks()
    }

    private func fetchStocks() {
        service.getStocks(completion: { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        })
    }

}
