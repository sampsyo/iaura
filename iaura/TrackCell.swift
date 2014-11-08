import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel! = nil
    
    var track: Track! {
        didSet {
            self.titleLabel.text = track.title
        }
    }

}
