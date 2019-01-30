

import UIKit


extension MovieTableViewCell {
    
    struct Props {
        
        let poster: URL?
        let name: String
        let released: Date
        let overview: String
        
        let select: PlainCommand
    }
    
}

extension MovieTableViewCell.Props {
    
    static let initial = MovieTableViewCell.Props(
        poster: nil,
        name: "",
        released: Date(),
        overview: "",
        select: PlainCommand{}
    )
    
}
