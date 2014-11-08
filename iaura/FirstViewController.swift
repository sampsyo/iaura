//
//  FirstViewController.swift
//  iaura
//
//  Created by Adrian Sampson on 11/8/14.
//  Copyright (c) 2014 Adrian Sampson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitTheMagicButton(sender: UIButton) {
        var aura = AURA(base: NSURL(string: "http://0.0.0.0:8338/aura")!)
        aura.getTracks({ (tracks : [Track]) in
            for track in tracks {
                println(track.title)
            }
        })
    }

}

