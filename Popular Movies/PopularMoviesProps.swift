
import Foundation

struct PopularMoviesProps  {
    
    let movies: [Movie]
    let status: Status
    
    enum Status {
        case empty
        case loading
        case loadingPage
        case success(loadNextPage: PlainCommand)
        case failure(reload: PlainCommand?, error: String)
    }
    
    struct Movie {
        let poster: URL?
        let name: String
        let released: Date
        let overview: String
    }
}

// MARK: Prism
extension PopularMoviesProps {
    
    var loadNextPage: PlainCommand? {
        if case .success(let loadNextPage) = self.status {
            return loadNextPage
        }
        return nil
    }
    
}
