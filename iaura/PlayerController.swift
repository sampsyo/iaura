import UIKit

class PlayerController: UIViewController {
    
    var player : AuraPlayer?
    @IBOutlet var statusLabel : UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

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

    @IBAction func togglePlay(sender: AnyObject) {
        if player!.playing() {
            player!.pause()
            playPauseButton.setTitle("Play", forState: UIControlState.Normal)
        } else {
            player!.play()
            playPauseButton.setTitle("Pause", forState: UIControlState.Normal)
        }
    }
}
