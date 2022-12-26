//
//  AddOrderView.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import SwiftUI

struct AddOrderView: View {

    @State var viewModel = AddOrderViewModel()
    @Binding var isDimissed: Bool
    
    var body: some View {
        NavigationView {
            Group {
                VStack(spacing: 8) {
                    TextField("Enter name", text: $viewModel.name)

                    Picker(selection: $viewModel.type, label: Text("")) {
                        Text("Cappuccino").tag("cap")
                        Text("Espresso").tag("es")
                        Text("Regular").tag("reg")
                    }.pickerStyle(.segmented)

                    Button("Place Order") {
                        viewModel.saveOrder()
                        isDimissed.toggle()
                    }.padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }.padding()
                .navigationBarTitle("Add Order")
        }
    }
}

#if DEBUG
    struct AddOrderView_Previews: PreviewProvider {
        static var previews: some View {
            AddOrderView(isDimissed: .constant(false))
        }
    }
#endif
