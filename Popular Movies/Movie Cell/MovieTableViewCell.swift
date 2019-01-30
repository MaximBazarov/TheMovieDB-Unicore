
import UIKit
import Nuke

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "MovieCell"
    
    var props = Props.initial {
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        props.select.execute()
    }
    
    private func render() {
        nameLabel.text = props.name
        overviewLabel.text = props.overview
        releaseYearLabel.text = yearString(from: props.released)
        if let imageURL = props.poster {
            Nuke.loadImage(
                with: imageURL,
                options: ImageLoadingOptions(
                    transition: .fadeIn(duration: 0.33)
                ),
                into: posterImageView
            )
        }
    }
    
}
