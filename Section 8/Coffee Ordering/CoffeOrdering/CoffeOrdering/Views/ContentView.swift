//
//  ContentView.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var viewModel = OrderListViewModel()
    @State private var showModal: Bool = false

    var body: some View {
        NavigationView {
            OrderListView(orders: self.viewModel.orders)
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
                })
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: $showModal)
                }
        }

    }
    
    private func reloadOrders() {
        viewModel.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
