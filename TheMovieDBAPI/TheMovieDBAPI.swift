//
//  TheMovieDBAPI.swift
//  TheMovieDB
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import Foundation


/// Facade class provides with search and discover endpoints
final class TheMovieDBAPI {
    
    enum APIError: Error {
        case parsingError(String)
        case networkError(Error)
        case badQuery(String)
        case curruptedData(Error)
        case emptyResult
    }
    
    static let imageBaseURL = URL(string: "http://image.tmdb.org/t/p/")!
    private let baseURL = "https://api.themoviedb.org/3/"
    private let apiKEY = "2696829a81b1b5827d515ff121700838"
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    
}


// MARK: - Interface -

extension TheMovieDBAPI {
    
    /// Discover popular movies request
    ///
    /// - Parameters:
    ///   - page: page
    ///   - success: callback
    ///   - failure: callback
    func discover(
        page: Int,
        success: @escaping (MoviesListResponse) -> Void,
        failure: @escaping (APIError) -> Void)
    {
        
        // hardcoded for simplicity, in real project it would be request builder
        let endpoint = baseURL + "discover/movie?sort_by=popularity.desc&api_key=\(apiKEY)&page=\(page)"
        let url = URL(string: endpoint)!
        let discoverRequest = URLRequest(url: url)
        request(discoverRequest, success: success, failure: failure)
    }
    
    
    /// Search request
    ///
    /// - Parameters:
    ///   - query: search query
    ///   - page: page
    ///   - success: callback
    ///   - failure: callback
    func search(
        query: String, page: Int,
        success: @escaping (MoviesListResponse) -> Void,
        failure: @escaping (APIError) -> Void)
    {
        
        // hardcoded for simplicity, in real project it would be request builder
        guard let percentEncodedQuery =  query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else { return failure(.badQuery(query)) }
        let endpoint = baseURL + "search/movie?api_key=\(apiKEY)&language=en-US&query=\(percentEncodedQuery)&page=\(page)&include_adult=false"
        guard let url = URL(string: endpoint) else { return failure(.badQuery(query)) }
        
        let searchRequest = URLRequest(url: url)
        
        request(searchRequest, success: success, failure: failure)
    }
    
}


// MARK: - Networking -
// this must be a separated class in a real project
extension TheMovieDBAPI {
    
    private func request(
        _ request: URLRequest,
        success: @escaping (MoviesListResponse) -> Void,
        failure: @escaping (APIError) -> Void)
    {
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                failure(.networkError(error))
                return
            }
            
            guard let data = data else {
                failure(.emptyResult)
                return
            }
            
            do {
                let value = try JSONDecoder().decode(
                    MoviesListResponse.self,
                    from: data
                )
                success(value)
            } catch {
                print(error)
                failure(.curruptedData(error))
            }
        }
        task.resume()
    }
}

extension TheMovieDBAPI {
    // MovieResponse to Movie converter
    static func toMovie(_ data: TheMovieDBAPI.MovieResponse) -> Movie {
        
        let poster: URL? = {
            guard let posterPath = data.posterPath else {return nil}
            return imageBaseURL
            .appendingPathComponent("w780")
            .appendingPathComponent(posterPath)
        }()
        
        return Movie(
            id: data.id,
            poster: poster,
            name: data.title,
            released: data.releaseDate.date,
            overview: data.overview ?? ""
        )
    }
}
