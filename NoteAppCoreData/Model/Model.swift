//
//  Model.swift
//  Rest API
//
//

import Foundation

struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let id: Int
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}

struct SearchResult:Decodable {
    let page: Int
    let results: [Movie]
    
    private enum CodingKeys: String, CodingKey{
        case page, results
    }
}
