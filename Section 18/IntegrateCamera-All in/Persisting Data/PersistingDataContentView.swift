//
//  PersistingDataContentView.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import SwiftUI

struct PersistingDataContentView: View {

    @ObservedObject private var viewModel = PersistingDataViewModel()

    var body: some View {
        VStack(alignment: .center) {

            Toggle(isOn: $viewModel.isOn) {
                Text("Toggle")
                    .font(.title)
                    .foregroundColor(Color.white)
            }.fixedSize()

        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background($viewModel.isOn.wrappedValue ? Color.accentColor : Color.cyan)
    }
}

struct PersistingDataContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersistingDataContentView()
    }
}
