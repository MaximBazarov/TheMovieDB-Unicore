

import UIKit
import Command


class PopularMoviesViewController: UIViewController {
    
    struct Props {
        let connectMoviesList: CommandOf<UIViewController>
        
        static let initial = Props(connectMoviesList: CommandOf<UIViewController>{ _ in })
    }

    var props = Props.initial

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedMoviesList" {
            props.connectMoviesList.execute(with: segue.destination)
        }
        
    }

}
