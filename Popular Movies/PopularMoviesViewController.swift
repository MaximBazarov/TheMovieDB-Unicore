
import UIKit

class PopularMoviesViewController: UIViewController {
    
    var props: PopularMoviesProps? {
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
        props?.refresh?.execute()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // So here we set the show case data to see how our view works
        self.props = PopularMoviesShowCase.firstPage
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        render()
    }

    private func render() {
        guard let props = props else { return }
        
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
            tableView.reloadData()
        }

        messageLabel.isHidden = !tableView.isHidden
    }
    
    
    private var movies: [PopularMoviesProps.Movie] {
        return props?.movies ?? []
    }
    
    private func movie(at index: Int) -> PopularMoviesProps.Movie? {
        guard 0..<movies.count ~= index else { return nil }
        return movies[index]
    }
    
    private var moviesCount: Int {
        return movies.count
    }
    
    private func selectMovie(at index: Int) {
    }
    
    private func loadNextPage() {
        props?.loadNextPage?.execute()
    }
    
}


extension PopularMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Force unwrap because there is no good way to handle this mistakes
        let movie = self.movie(at: indexPath.row)!
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        cell.props = movie
        return cell
    }
    
    
}

extension PopularMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == moviesCount - 7 {
            props?.loadNextPage?.execute()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectMovie(at: indexPath.row)
    }
}
