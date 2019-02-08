

import UIKit

class SearchViewController: UIViewController {
    
    var props = Props.showCase {
        didSet {}
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var suggestionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchBar
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedMoviesList" {
            props.connectMoviesList.execute(with: segue.destination)
        }
    }

}



// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        toggleSuggestionTable(isHidden: false)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        toggleSuggestionTable(isHidden: true)
        if let query = searchBar.text, !query.isEmpty {
            search(query)
        }
        return true
        
    }
    
    
    func toggleSuggestionTable(isHidden hidden: Bool) {
        UIView.animate(withDuration: 0.24) {
            self.suggestionsTableView.isHidden = hidden
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(false)
    }
}


// MARK: - Suggestions Data Source
extension SearchViewController {
    
    func suggestion(at index: Int) -> String? {
        guard 0..<props.suggestions.count ~= index else { return nil }
        return props.suggestions[index]
    }
    
    var suggestionsCount: Int {
        return props.suggestions.count
    }
    
    func selectSuggestion(at index: Int) {
        guard let suggestion = suggestion(at: index) else { return }
        searchBar.text = suggestion
        searchBar.endEditing(true)
    }
    
    func search(_ query: String) {
        props.search.execute(with: query)
    }
}

// MARK: UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Force unwrap because there is no good way to handle this mistakes
        let suggestion = self.suggestion(at: indexPath.row)!
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell")!
        cell.textLabel?.text = suggestion
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectSuggestion(at: indexPath.row)
    }
}
