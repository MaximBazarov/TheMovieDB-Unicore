//
//  TheMovieDBAPITests.swift
//  TheMovieDBTests
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class TheMovieDBAPITests: XCTestCase {
    
    //MARK: - Queries
    func testSearch_MockValidResponse_QueryWithSpaces_ShouldReturn20response() {
        let exp = expectation(description: "Valid response")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.valid
        
        TheMovieDBAPI(session: sessionMock).search(
            query: "test query with spaces",
            page: 1,
            result: { r in
                if case .success(_) = r { exp.fulfill() }
                if case let .failure(error) = r { XCTFail("\(error)") }
            }
        )
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    // MARK: - Responses
    func testDiscover_MockValidResponse_ShouldReturn20response() {
        let exp = expectation(description: "Valid response")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.valid
        
        TheMovieDBAPI(session: sessionMock).discover(
            page: 1,
            result: { r in
                if case let .success(response) = r {
                    guard response.results.count  == 20 else { return XCTFail("") }
                    exp.fulfill()
                }
                if case let .failure(error) = r { XCTFail("\(error)") }
            }
        )
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSearch_MockValidResponse_ShouldReturn20response() {
        let exp = expectation(description: "Valid response")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.valid
        
        TheMovieDBAPI(session: sessionMock).search(
            query: "movie",
            page: 1,
            result: { r in
                if case let .success(response) = r {
                    guard response.results.count  == 20 else { return XCTFail("") }
                    exp.fulfill()
                }
                if case let .failure(error) = r { XCTFail("\(error)") }
            }
        )
        
        waitForExpectations(timeout: 1, handler: nil)
        
    }
  
    
    // MARK: Invalid response

    func testDiscover_MockInvalidResponse_ShouldReturnCurruptedData() {
        let exp = expectation(description: "Error")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.invalid
        
        TheMovieDBAPI(session: sessionMock).discover(
            page: 1,
            result: { r in
                if case .success(_) = r {
                    XCTFail("Must be a currupted data erorr")
                }
                if case let .failure(error) = r {
                    if case .curruptedData = error { exp.fulfill() }
                    else { XCTFail("\(error)") }
                }
            }
        )
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSearch_MockInvalidResponse_ShouldReturnCurruptedData() {
        let exp = expectation(description: "Error")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.invalid
        
        TheMovieDBAPI(session: sessionMock).search(
            query: "movie",
            page: 1,
            result: { r in
                if case .success(_) = r {
                    XCTFail("Must be a currupted data erorr")
                }
                if case let .failure(error) = r {
                    if case .curruptedData = error { exp.fulfill() }
                    else { XCTFail("\(error)") }
                }
            }
        )
        waitForExpectations(timeout: 1, handler: nil)
        
    }
    
    // MARK: Missing fields response
    
    func testDiscover_MockMissingFieldsResponse_ShouldReturnCurruptedData() {
        let exp = expectation(description: "Error")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.missingFields
        
        TheMovieDBAPI(session: sessionMock).discover(
            page: 1,
            result: { r in
                if case .success(_) = r {
                    XCTFail("Must be a currupted data erorr")
                }
                if case let .failure(error) = r {
                    if case .curruptedData = error { exp.fulfill() }
                    else { XCTFail("\(error)") }
                }
            }
        )
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSearch_MockMissingFieldsResponse_ShouldReturnCurruptedData() {
        let exp = expectation(description: "Error")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.missingFields
        
        TheMovieDBAPI(session: sessionMock).search(
            query: "movie",
            page: 1,
            result: { r in
                if case .success(_) = r {
                    XCTFail("Must be a currupted data erorr")
                }
                if case let .failure(error) = r {
                    if case .curruptedData = error { exp.fulfill() }
                    else { XCTFail("\(error)") }
                }
            }
        )
        waitForExpectations(timeout: 1, handler: nil)
        
    }
    
    // MARK: not JSON response
    
    func testDiscover_MockHTMLResponse_ShouldReturnCurruptedData() {
        let exp = expectation(description: "Error")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.html
        
        TheMovieDBAPI(session: sessionMock).discover(
            page: 1,
            result: { r in
                if case .success(_) = r {
                    XCTFail("Must be a currupted data erorr")
                }
                if case let .failure(error) = r {
                    if case .curruptedData = error { exp.fulfill() }
                    else { XCTFail("\(error)") }
                }
            }
        )
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSearch_MockHTMLResponse_ShouldReturnCurruptedData() {
        let exp = expectation(description: "Error")
        let sessionMock = URLSessionMock()
        sessionMock.completionData = JSONMocks.html
        
        TheMovieDBAPI(session: sessionMock).search(
            query: "movie",
            page: 1,
            result: { r in
                if case .success(_) = r {
                    XCTFail("Must be a currupted data erorr")
                }
                if case let .failure(error) = r {
                    if case .curruptedData = error { exp.fulfill() }
                    else { XCTFail("\(error)") }
                }
            }
        )
        waitForExpectations(timeout: 1, handler: nil)
        
    }
    
}
