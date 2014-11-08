//
//  HomeViewController.swift
//  iaura
//
//  Created by Adrian Sampson on 11/8/14.
//  Copyright (c) 2014 Adrian Sampson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var aura: AURA?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
