//
//  MoviesListResponse.swift
//  TheMovieDB
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import Foundation

extension TheMovieDBAPI {
    
    
    /// A movie list JSON response
    struct MoviesListResponse: Codable {
        let page: Int
        let totalResults: Int
        let totalPages: Int
        let results: [MovieResponse]
        
        enum CodingKeys: String, CodingKey {
            case page = "page"
            case totalResults = "total_results"
            case totalPages = "total_pages"
            case results = "results"
        }
    }
    
    /// A single movie block
    struct MovieResponse: Codable {
        let id: Int
        let title: String
        let posterPath: String?
        let overview: String?
        let releaseDate: DateFormat
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case posterPath = "poster_path"
            case overview = "overview"
            case releaseDate = "release_date"
        }
    }
    
}
