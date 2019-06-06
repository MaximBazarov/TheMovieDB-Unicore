//
//  Movie.swift
//  TheMovieDB
//
//  Created by Maksim Bazarov on 08.10.18.
//  Copyright © 2018 Maksim Bazarov. All rights reserved.
//

import Foundation


/// Domain model is a model from real world

struct Movie {
    let id: Int
    let poster: URL?
    let name: String
    let released: Date
    let overview: String
}
