
import Foundation

extension MovieDetailsViewController {

    struct Props {
        let poster: URL?
        let name: String
        let released: Date
        let overview: String
    }
    
}



extension MovieDetailsViewController.Props {
    
    static let initial = MovieDetailsViewController.Props(
        poster: nil,
        name: "",
        released: Date(),
        overview: ""
    )
    
}

extension MovieDetailsViewController.Props {
    
    static let showCase = MovieDetailsViewController.Props(
        poster: URL(string: "http://image.tmdb.org/t/p/w780/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg")!,
        name: "Batman",
        released: Date(),
        overview: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham\'s underworld."
    )
    
}

