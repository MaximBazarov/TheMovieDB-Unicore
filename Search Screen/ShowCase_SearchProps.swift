

import UIKit
import Command

extension SearchViewController.Props {
    
    static let showCase = SearchViewController.Props(
        query: "",
        suggestions: ["Batman", "Robin", "Terminator"],
        search: CommandOf<String>{ query in
            print("SEARCH: \(query)")
        },
        connectMoviesList: CommandOf<UIViewController>{ moviesList in
            guard let moviesList = moviesList as? MoviesListViewController else {
                fatalError("\(#function) requires a controller to be a MoviesListViewController")
            }
            
            // here you can connect the Movies List screen with its Connector(Presenter)
            
            // this is just for showcase purpose, you should never create props here
            moviesList.props = MoviesListViewController.Props.initial
        }
    )
}

