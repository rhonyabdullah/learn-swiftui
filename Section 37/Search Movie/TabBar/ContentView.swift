//
//  ContentView.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 13/12/22.
//

import SwiftUI
import OSLog

struct ContentView: View {

    @StateObject private var viewModel = MovieListViewModel()
    @State private var search = ""

    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.id) { movie in
                HStack {
                    AsyncImage(url: movie.poster, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                    }, placeholder: {
                            ProgressView()
                        })
                    Text(movie.title)
                        .font(.title)
                }
            }.listStyle(.plain).searchable(text: $search).onChange(of: search) { value in
                viewModel.search(name: value)
            }.navigationTitle("Movies")
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
