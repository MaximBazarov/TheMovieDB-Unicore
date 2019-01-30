
import Foundation

struct PopularMoviesProps  {
    
    let movies: [Movie]
    let status: Status
    
    let refresh: PlainCommand?
    
    enum Status {
        case loading
        case loaded(loadNextPage: PlainCommand?)
        case failure(error: String)
    }
    
    struct Movie {
        let poster: URL?
        let name: String
        let released: Date
        let overview: String
    }
}

// MARK: Prisms
extension PopularMoviesProps {
    
    /// Prism is a convenient way to access data inside the props
    
    /// Returns the command to load next page or nil
    var loadNextPage: PlainCommand? {
        guard  case .loaded(let loadNextPage) = self.status else { return nil }
        return loadNextPage
    }
    
    var isLoading: Bool {
        guard case .loading = self.status else { return false }
        return true
    }
    
}
