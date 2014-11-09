import UIKit

class HomeViewController: UIViewController {
    var aura: AURA?
    @IBOutlet var serverField: UITextField!
    
    @IBAction func touchConnect(sender: UIButton) {
        var server = serverField.text
        aura = AURA(base: NSURL(string: server)!)
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
