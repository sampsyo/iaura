import UIKit

class HomeViewController: UIViewController {
    var aura: AURA?
    
    @IBAction func touchConnect(sender: UIButton) {
        aura = AURA(base: NSURL(string: "http://0.0.0.0:8338/aura")!)
        // TODO this should be a server info ping
        aura!.getTracks({ (tracks : [Track]) in
            self.performSegueWithIdentifier("ShowConnectedView", sender: self)
        })
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowConnectedView") {
            let connectedController = segue.destinationViewController as ConnectedViewController
            connectedController.aura = aura
        }
    }

}
