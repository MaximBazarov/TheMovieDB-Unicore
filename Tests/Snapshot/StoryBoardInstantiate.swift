//
//  StoryBoardInstantiate.swift
//  TheMovieDBTests
//
//  Created by Maxim Bazarov on 27.07.19.
//  Copyright © 2019 Maxim Bazarov. All rights reserved.
//

import UIKit
extension UIStoryboard {

    static func instantiateInitial<VC: UIViewController>(vc vcClass: VC.Type, storyboardName: String? = nil) -> VC {
        let name = storyboardName ?? String(describing: vcClass)
        return viewController = UIStoryboard(
            name: name,
            bundle: Bundle(for: vcClass)
        ).instantiateInitialViewController() as! VC
    }
}
