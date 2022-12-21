//
//  AddCoffeeOrderView.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import SwiftUI
import OSLog

struct AddCoffeeOrderView: View {

    @ObservedObject private var viewModel = AddCoffeeOrderViewModel()
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Information").font(.body)) {
                        TextField("Enter name", text: self.$viewModel.name)
                    }
                    Section(header: Text("Select Coffee").font(.body)) {
                        ForEach(viewModel.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: $viewModel.coffeeName)
                        }
                    }
                    Section(
                        header: Text("Select Size").font(.body),
                        footer: OrderTotalView(total: viewModel.total)
                    ) {
                        Picker("", selection: $viewModel.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place Order") {
                        viewModel.placeOrder()
                        isPresented = false
                    }
                } .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)

                    .background(Color(red: 46 / 255, green: 204 / 255, blue: 113 / 255))
                    .cornerRadius(10)

            }.navigationBarTitle("Order Coffee")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {

    let coffee: CoffeeViewModel
    @Binding var selection: String

    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title2)
                .padding([.leading], 18)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
