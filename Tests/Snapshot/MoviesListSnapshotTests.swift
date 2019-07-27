//
//  MoviesListSnapshotTests.swift
//  TheMovieDBTests
//
//  Created by Maxim Bazarov on 27.07.19.
//  Copyright © 2019 Maxim Bazarov. All rights reserved.
//

import XCTest
import UIKit
import SnappyShrimp

@testable import TheMovieDB


class MoviesListSnapshotTests: SnapshotTest {

    override func setUp() {
        super.setUp()
        self.recordMode = true; // set to true to create a new referencing images, false to test
    }

        // Note: Current refs were written on lates devices (iPhone 8/8Plus, iPad 12 Pro).
        // Due to differences in devices, that you can't override, don't change testing devices, unless you want to override refs.
        func testExample() {
            let vc = UIStoryboard.instantiateInitial(
                vc: MainScreenViewController.self,
                storyboardName: "MainScreen"
            )
            //Has to be launched on iPhone with @2 scale and P3 screen
            verify(vc, for: Device.iPhone8.landscape)
            verify(vc, for: Device.iPhone8.portrait)
            verify(vc, for: Device.iPhoneSE.portrait)


            //Has to be launched on iPhone with @3 scale and P3 screen
            verify(vc, for: Device.iPhone8Plus.landscape)
            verify(vc, for: Device.iPhone8Plus.portrait)

            //Has to be launched on any iPad with @2 scale and sRGB screen
            verify(vc, for: Device.iPadPro12_9.portrait.fullScreen)
            verify(vc, for: Device.iPadPro12_9.portrait.oneThird)
            verify(vc, for: Device.iPadPro12_9.portrait.twoThirds)


            //Has to be launched on iPhone with @3 scale and P3 screen
            verify(vc, for: Device.iPhoneX.portrait)
            verify(vc, for: Device.iPhoneX.landscapeLeft)
            verify(vc, for: Device.iPhoneX.landscapeRight)

        }
    }
