//
//  DateFormat.swift
//  TheMovieDB
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import Foundation



extension TheMovieDBAPI {
    
    /// Data format parser 
    struct DateFormat: Codable {
        let date: Date

        private static let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd" // "2017-10-25"
            return formatter
        }()
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            guard let date = DateFormat.formatter.date(from: rawValue) else {
                throw APIError.parsingError("\(rawValue) doesn't match the format \(DateFormat.formatter.dateFormat ?? "") ")
            }
            self.date = date
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(DateFormat.formatter.string(from: date))
        }
    }
}
