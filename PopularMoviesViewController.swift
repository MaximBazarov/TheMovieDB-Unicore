

import UIKit

class PopularMoviesViewController: UIViewController {

    var props = Props.initial

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedMoviesList" {
            props.connectMoviesList.execute(with: segue.destination)
        }
        
    }

}
