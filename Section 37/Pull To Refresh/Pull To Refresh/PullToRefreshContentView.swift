//
//  PullToRefreshContentView.swift
//  SwiftUIDefaultBasicAnimation
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//
import Foundation
import SwiftUI

struct PullToRefreshContentView: View {

    @ObservedObject private var viewModel = CustomerListViewModel()

    var body: some View {
        List(viewModel.customers, id: \.self) { customer in
            Text(customer)
                .font(.title)
                .foregroundColor(Color.black)
        }.onAppear {
            viewModel.fetch()
        }.refreshable {
            viewModel.fetch()
        }
    }
}

struct PullToRefreshContentView_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshContentView()
    }
}
