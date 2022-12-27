//
//  SearchBarContentView.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import SwiftUI

struct SearchBarContentView: View {

    private let names = ["Heidy", "jake", "Aliex", "Jerry", "Safari"]

    @State private var searchTerm: String = ""

    var body: some View {
        List {
            SearchBar(text: $searchTerm)

            ForEach(names.filter {
                searchTerm.isEmpty ? true: $0.localizedCaseInsensitiveContains(searchTerm)
            }, id: \.self) { name in
                Text(name)
            }
        }
    }
}

struct SearchBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarContentView()
    }
}
