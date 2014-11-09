import UIKit

class PlayerController: UIViewController {
    
    var player : AuraPlayer?
    @IBOutlet var statusLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var status = ""
        for track in player!.tracks() {
            status += track.title + "\n"
        }
        statusLabel.text = status
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
