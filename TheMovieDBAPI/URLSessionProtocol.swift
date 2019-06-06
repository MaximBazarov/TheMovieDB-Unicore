//
//  URLSessionProtocol.swift
//  TheMovieDB
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import Foundation

/// Dependency invertion protocol for URLSession, allows me to test API Service
protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}


protocol URLSessionDataTaskProtocol {
    func cancel()
    func resume()
    func suspend()
    var state: URLSessionTask.State { get }
}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completion)
    }
}


extension URLSessionDataTask: URLSessionDataTaskProtocol { }
