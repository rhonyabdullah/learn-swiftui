//
//  FlagDetailView.swift
//  Display And Passing Data to modal from List
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import SwiftUI

struct FlagDetailView: View {

    var flag: String = ""
    @Binding var showModal: Bool
    @Binding var country: String

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(flag)
                .font(.custom("Arial", size: 200))

            TextField(text: $country) {
                Text("Enter country name")
            }.multilineTextAlignment(.center)

            Button("Submit") {
                showModal.toggle()
            }.padding(.top)
        }
    }
}

#if DEBUG
    struct FlagDetailView_Previews: PreviewProvider {
        static var previews: some View {
            FlagDetailView(showModal: .constant(true), country: .constant("Wales"))
        }
    }
#endif
