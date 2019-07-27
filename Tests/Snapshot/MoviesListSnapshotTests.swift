//
//  MoviesListSnapshotTests.swift
//  TheMovieDBTests
//
//  Created by Maxim Bazarov on 27.07.19.
//  Copyright © 2019 Maxim Bazarov. All rights reserved.
//

import XCTest
import UIKit
import Nuke
import SnappyShrimp

@testable import TheMovieDB

class MoviesListSnapshotTests: SnapshotTest {

    override func setUp() {
        super.setUp()
        let path = Bundle(for: MoviesListSnapshotTests.self)
            .path(forResource: "movie-poster-mock", ofType: "jpg")
        let moviePoster  = try! Data(contentsOf: URL(fileURLWithPath: path!))
        ImagePipeline.shared = ImagePipeline(defaultFile: MockDataLoading.File(
            data: nil,
            mimeType: .jpeg
        ), dataCollection: [
            "https://valid.image.mock.com/image.jpg" : MockDataLoading.File(
                data: moviePoster,
                mimeType: .jpeg
            )
        ])
    }

    func testMoviesList() {
        let vc = UIStoryboard.instantiateInitial(
            vc: MoviesListViewController.self,
            storyboardName: "MoviesList"
        )

        vc.props = mockMoviesListProps

        verify(vc, for: Device.iPhoneXR.portrait, delay: 1)
        verify(vc, for: Device.iPhoneXR.landscapeLeft)
        verify(vc, for: Device.iPhoneXR.landscapeRight)
    }

}
