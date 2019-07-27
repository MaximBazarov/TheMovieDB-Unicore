//
//  JSONMocks.swift
//  TheMovieDBTests
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import XCTest


class JSONMocks {

    static let valid: Data = {
        let path = Bundle(for: JSONMocks.self).path(forResource: "ValidResponse", ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!))
    }()

    static let invalid: Data = {
        let path = Bundle(for: JSONMocks.self).path(forResource: "InvalidResponse", ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!))
    }()

    static let html: Data = {
        let path = Bundle(for: JSONMocks.self).path(forResource: "NotJson", ofType: "html")
        return try! Data(contentsOf: URL(fileURLWithPath: path!))
    }()

    static let missingFields: Data = {
        let path = Bundle(for: JSONMocks.self).path(forResource: "MissingFieldsResponse", ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!))
    }()

}
