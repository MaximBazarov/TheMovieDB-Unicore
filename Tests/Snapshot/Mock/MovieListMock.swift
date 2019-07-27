//
//  MovieListMock.swift
//  TheMovieDBTests
//
//  Created by Maxim Bazarov on 27.07.19.
//  Copyright © 2019 Maxim Bazarov. All rights reserved.
//

import XCTest
import Command
@testable import TheMovieDB



let mockMoviesListProps = MoviesListViewController.Props(
    movies: [
        MovieTableViewCell.Props(
            poster: URL(string: "https://valid.image.mock.com/image.jpg")!,
            name: "Batman",
            released: Date(),
            overview: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham\'s underworld.",
            select: Command{}
        ),
        MovieTableViewCell.Props(
            poster: URL(string: "https://valid.image.mock.com/image.jpg")!,
            name: "Batman",
            released: Date(),
            overview: "The Dynamic Duo faces four super-villains who plan to hold the world for ransom with the help of a secret invention that instantly dehydrates people.",
            select: Command{}
        ),
        MovieTableViewCell.Props(
            poster: URL(string: "https://no.image")!,
            name: "MOCK: Image Load Failed",
            released: Date(),
            overview: "Here shouldn't be an image. This mock shows that movies list correctly handles errors.",
            select: Command{}
        ),
        MovieTableViewCell.Props(
            poster: URL(string: "https://valid.image.mock.com/image.jpg")!,
            name: "Batman Returns",
            released: Date(),
            overview: "Having defeated the Joker, Batman now faces the Penguin - a warped and deformed individual who is intent on being accepted into Gotham society. Crooked businessman Max Schreck is coerced into helping him become Mayor of Gotham and they both attempt to expose Batman in a different light. Selina Kyle, Max\'s secretary, is thrown from the top of a building and is transformed into Catwoman - a mysterious figure who has the same personality disorder as Batman. Batman must attempt to clear his name, all the time deciding just what must be done with the Catwoman.",
            select: Command{}
        )
    ], status: .loaded(loadNextPage: nil), refresh: nil, connectDetails: nil
)
