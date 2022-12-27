//
//  SearchBar.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> some UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
    
}

internal class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    
    @Binding var text: String

    init(text: Binding<String>) {
        _text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
    }
}

struct Previews_SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search here..."))
            .padding()
    }
}
