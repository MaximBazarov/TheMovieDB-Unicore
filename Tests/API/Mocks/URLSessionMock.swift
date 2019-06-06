//
//  URLSessionMock.swift
//  TheMovieDBTests
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class URLSessionMock: URLSessionProtocol {
    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        defer {
            completion(completionData, completionResponse, completionError)
        }
        
        return URLSessionDataTaskMock()
    }
    
    var completionData: Data?
    var completionResponse: URLResponse?
    var completionError: Error?
    
}

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    
    private (set) var state: URLSessionTask.State = .suspended
    
    func cancel() { state = .canceling }
    func suspend() { state = .suspended }
    func resume() { state = .running }
}
