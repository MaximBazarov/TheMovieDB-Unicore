
import UIKit

struct MovieDetailsProps {
    let poster: URL?
    let name: String
    let released: Date
    let overview: String
}


class MovieDetailsViewController: UIViewController {
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var releaseYearLabel: UILabel!
    
    var props: MovieDetailsProps? {
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
        guard let props = props else { return }
        nameLabel.text = props.name
        overviewLabel.text = props.overview
        let year = Calendar.current.component(.year, from: props.released)
        releaseYearLabel.text = String(year)
    }
//
//    class func instantiate() -> MovieDetailsViewController {
//        guard let controller = UIStoryboard(
//            name: "MovieDetails",
//            bundle: Bundle(for: MovieDetailsViewController.self)
//            ).instantiateInitialViewController() as? MovieDetailsViewController
//            else { fatalError("MovieDetails.storyboard initial view controller must be of type MovieDetailsViewController")}
//        return controller
//    }
}
