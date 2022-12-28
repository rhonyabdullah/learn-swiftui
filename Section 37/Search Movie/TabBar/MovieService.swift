//
//  MovieService.swift
//  SearchMovie
//
//  Created by Rhony Abdullah Siagian on 28/12/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

class MovieService {
    
    func getMovies(searchTerm: String) async throws -> [Movie] {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "omdbapi.com"
        components.queryItems = [
            URLQueryItem(name: "s", value: searchTerm),
            URLQueryItem(name: "apiKey", value: "5748f8a1")
        ]
        
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        
        guard (urlResponse as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let response = try? JSONDecoder().decode(MovieReponse.self, from: data)
        
        return response?.movies ?? []
    }
}
