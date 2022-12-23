//
//  FlagDetailView.swift
//  Display And Passing Data to modal from List
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import SwiftUI

struct FlagDetailView: View {

    @Binding var viewModel: FlagViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(viewModel.flag)
                .font(.custom("Arial", size: 200))

            TextField(text: $viewModel.country) {
                Text("Enter country name")
            }.multilineTextAlignment(.center)

            Button("Submit") {
                viewModel.showModal.toggle()
            }.padding(.top)
        }
    }
}

#if DEBUG
    struct FlagDetailView_Previews: PreviewProvider {
        static var previews: some View {
            FlagDetailView(viewModel: .constant(FlagViewModel()))
        }
    }
#endif
