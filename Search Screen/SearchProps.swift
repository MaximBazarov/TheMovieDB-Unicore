

import UIKit

extension SearchViewController {
    
    struct Props {
        
        let query: String
        let suggestions: [String]
        
        let search: Command<String>
        let connectMoviesList: Command<UIViewController>
    }
    
}

extension SearchViewController.Props {
    
    static let initial = SearchViewController.Props(
        query: "",
        suggestions: [],
        search: Command<String>{ _ in },
        connectMoviesList: Command<UIViewController>{ _ in }
    )
}


extension SearchViewController.Props {
    
    static let showCase = SearchViewController.Props(
        query: "",
        suggestions: ["Batman", "Robin", "Terminator"],
        search: Command<String>{ query in
            print("SEARCH: \(query)")
        },
        connectMoviesList: Command<UIViewController>{ moviesList in
            guard let moviesList = moviesList as? MoviesListViewController else {
                fatalError("\(#function) requires a controller to be a MoviesListViewController")
            }
            
            // here you can connect the Movies List screen with its Connector(Presenter)
            
            // this is just for showcase purpose, you should never create props here
            moviesList.props = MoviesListViewController.Props.initial
        }
    )
}

