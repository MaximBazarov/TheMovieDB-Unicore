
import UIKit
import Nuke


class MovieDetailsViewController: UIViewController {

    struct Props {
        let poster: URL?
        let name: String
        let released: Date
        let overview: String

        static let initial = MovieDetailsViewController.Props(
            poster: nil,
            name: "",
            released: Date(),
            overview: ""
        )
    }
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var releaseYearLabel: UILabel!
    
    var props = Props.showCase {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
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


