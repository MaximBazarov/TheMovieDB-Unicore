
import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "MovieCell"
    
    var props: PopularMoviesProps.Movie? {
        didSet {
            render()
        }
    }
    
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var overviewLabel: UILabel!
    @IBOutlet private var releaseYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        releaseYearLabel.layer.borderColor = UIColor(white: 151.0 / 255.0, alpha: 1.0).cgColor
        releaseYearLabel.layer.borderWidth = 0.5
        releaseYearLabel.layer.cornerRadius = 2
    }

    private func render() {
        guard let props = props else { return }
        nameLabel.text = props.name
        overviewLabel.text = props.overview
        let year = Calendar.current.component(.year, from: props.released)
        releaseYearLabel.text = String(year)
    }
    
}
