
import UIKit
import Command

class MoviesListViewController: UIViewController {
    
    struct Props  {
        
        let movies: [MovieTableViewCell.Props]
        let status: Status
        
        let refresh: Command?
        let connectDetails: CommandOf<UIViewController>?
        
        enum Status {
            case loading
            case loaded(loadNextPage: Command?)
            case failure(error: String)
        }
        
        static let initial = MoviesListViewController.Props.init(
            movies: [],
            status: .loaded(loadNextPage: nil),
            refresh: nil,
            connectDetails: nil
        )
    }
    
    /// this fakes props updates every second, to test the performance of render
    let fakeProps = FakeProps(); class FakeProps {
        
        func fake(vc: MoviesListViewController) {
            DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned vc] in
                    vc.props = Props.firstPageShowCase
                    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.1) { [unowned self] in
                        self.fake(vc: vc)
                    }
                }
            }
            
        }
    }
    
    var props = Props.firstPageShowCase {
        didSet {
            guard isViewLoaded else { return }
            view.setNeedsLayout()
        }
    }
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var errorTitleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var progressView: UIView!
    @IBAction func reloadButtonAction(_ sender: Any) {
        props.refresh?.execute()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fakeProps.fake(vc: self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        render()
    }
    
    
    // MARK: - Render
    
    /// you need to save old movies to skip a tableview data reloading when
    /// the movies collection haven't changed
    private var oldMovies = [MovieTableViewCell.Props]()
    
    private func render() {
        progressView.isHidden = !props.isLoading
        
        messageLabel.text = "There is no movies."
        errorTitleLabel.isHidden = true
        if case .failure(let message) = props.status {
            errorTitleLabel.isHidden = false
            progressView.isHidden = true
            messageLabel.text = message
        }
        
        tableView.isHidden = true
        if props.movies.count > 0 {
            tableView.isHidden = false
            if oldMovies != props.movies { tableView.reloadData() }
            oldMovies = props.movies
        }
        
        messageLabel.isHidden = !tableView.isHidden
    }
    
    
    private func movie(at index: Int) -> MovieTableViewCell.Props? {
        guard props.movies.indices.contains(index) else { return nil }
        return props.movies[index]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        props.connectDetails?.execute(with: segue.destination)
    }
    
    private func loadNextPage() {
        props.loadNextPage?.execute()
    }
    
}


// MARK: - Props Prisms

extension MoviesListViewController.Props {
    
    /// Prism is a convenient way to access data inside the props
    
    /// Returns the command to load next page or nil
    var loadNextPage: Command? {
        guard  case .loaded(let loadNextPage) = self.status else { return nil }
        return loadNextPage
    }
    
    var isLoading: Bool {
        guard case .loading = self.status else { return false }
        return true
    }
    
}


// MARK: - UITableView

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return props.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movie(at: indexPath.row)!
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        cell.props = movie
        return cell
    }
    
}

extension MoviesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == props.movies.count - 7 {
            props.loadNextPage?.execute()
        }
    }
    
}

