import UIKit

class DismissSegue: UIStoryboardSegue {
    override func perform() {
        self.sourceViewController.presentingViewController!!.dismissViewControllerAnimated(true, completion: nil)
    }
}
