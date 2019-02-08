
import UIKit

class MoviesListViewController: UIViewController {
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        render()
    }

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
            tableView.reloadData()
        }

        messageLabel.isHidden = !tableView.isHidden
    }
    
    
    private func movie(at index: Int) -> MovieTableViewCell.Props? {
        guard 0..<props.movies.count ~= index else { return nil }
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
