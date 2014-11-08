//
//  HomeViewController.swift
//  iaura
//
//  Created by Adrian Sampson on 11/8/14.
//  Copyright (c) 2014 Adrian Sampson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchConnect(sender: UIButton) {
        var aura = AURA(base: NSURL(string: "http://0.0.0.0:8338/aura")!)
        aura.getTracks({ (tracks : [Track]) in
            for track in tracks {
                println(track.title)
            }
            self.performSegueWithIdentifier("ShowConnectedView", sender: self)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
