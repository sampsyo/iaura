import UIKit
import AVFoundation

class ConnectedViewController: UINavigationController {
    var aura: AURA?
    var player = AVQueuePlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func enqueue(track : Track) {
        var item = AVPlayerItem(URL: aura!.audioURL(track))
        player.insertItem(item, afterItem: nil)
        player.play()
    }
}
