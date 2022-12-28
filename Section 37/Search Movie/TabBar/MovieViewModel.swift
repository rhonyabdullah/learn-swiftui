//
//  MovieViewModel.swift
//  SearchMovie
//
//  Created by Rhony Abdullah Siagian on 28/12/22.
//

import Foundation
import OSLog

@MainActor
class MovieListViewModel: ObservableObject {

    private let service = MovieService()

    @Published var movies = [MovieViewModel]()

    func search(name: String?) {

        guard let name = name, name.count >= 3  else {
            return
        }
        
        movies.removeAll()

        Task.init(priority: .background) {
            do {
                Logger().debug("search key: \(name.trimmed())")
                movies = try await service.getMovies(searchTerm: name.trimmed()).map(MovieViewModel.init)
            } catch NetworkError.badURL {
                Logger().debug("bad url error, search term: \(name)")
            } catch NetworkError.badID {
                Logger().debug("bad id error, search term: \(name)")
            } catch {
                Logger().debug("Unknwon error \(error)")
            }
        }
    }

}

struct MovieViewModel {

    let movie: Movie

    var id: String {
        movie.id
    }

    var title: String {
        movie.title
    }

    var poster: URL? {
        URL(string: movie.poster)
    }

}
