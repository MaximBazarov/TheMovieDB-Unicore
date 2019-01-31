

import UIKit

extension PopularMoviesViewController {
    
    struct Props {
        let connectMoviesList: Command<UIViewController>
        
        static let initial = Props(connectMoviesList: Command<UIViewController>{ _ in })
    }
    
    
}
