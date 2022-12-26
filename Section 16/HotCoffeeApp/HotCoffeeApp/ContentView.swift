//
//  ContentView.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import SwiftUI
import CoreData
import OSLog

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var viewModel: OrderListViewModel
    @State var isPresented: Bool = false

    init() {
        viewModel = OrderListViewModel()
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.orders, id: \.self) { order in
                    HStack {
                        Image(order.type)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)

                        Text(order.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                    }
                }.onDelete(perform: delete)
            }
                .navigationBarTitle("Orders")
                .toolbar {
                Button("Add New Order") {
                    isPresented.toggle()
                }
            }.sheet(isPresented: $isPresented, onDismiss: {
                Logger().debug("sheet on dismiss fired")
                viewModel.fetchAllORders()
            }) { AddOrderView(isDimissed: $isPresented) }
        }
    }
    
    private func delete(at offsets: IndexSet?) {
        offsets?.forEach { index in
            viewModel.deleteOrder(viewModel.orders[index])
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
