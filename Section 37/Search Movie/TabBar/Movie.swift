//
//  Movie.swift
//  SearchMovie
//
//  Created by Rhony Abdullah Siagian on 28/12/22.
//

import Foundation

struct MovieReponse: Decodable {
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let title: String
    let id: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case id = "imdbID"
        case poster = "Poster"
    }

}
