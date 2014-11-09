import UIKit

class ConnectedViewController: UINavigationController {
    var aura: AURA? {
        didSet {
            player = AuraPlayer(a: aura!)
        }
    }
    var player: AuraPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func enqueue(track : Track) {
        player!.enqueue(track)
        player!.play()
    }
}
