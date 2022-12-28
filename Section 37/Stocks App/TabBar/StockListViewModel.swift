//
//  StockListViewModel.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 28/12/22.
//

import Foundation

@MainActor
class StockListViewModel: ObservableObject {

    @Published var stocks = [StockViewModel]()

    func getAllStocks(refresh: Bool = false) {
        
        if refresh {
            stocks.removeAll()
        }
        
        Task.init(priority: TaskPriority.background) {
            let stocks = await StockService().getStocks()
            self.stocks = stocks.map(StockViewModel.init)
        }
        
    }

}

struct StockViewModel {
    let stock: Stock

    var name: String {
        stock.name
    }

    var price: Double {
        stock.price
    }
}
