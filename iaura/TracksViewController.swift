//
//  TracksViewController.swift
//  iaura
//
//  Created by Adrian Sampson on 11/8/14.
//  Copyright (c) 2014 Adrian Sampson. All rights reserved.
//

import UIKit

class TracksViewController: UITableViewController {
    var aura: AURA?
    var tracks: [Track]?

    override func viewDidLoad() {
        super.viewDidLoad()
        println("table view loaded")
        aura = (self.navigationController as ConnectedViewController).aura
        
        // Add pull-to-refresh.
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "loadTracks", forControlEvents: UIControlEvents.ValueChanged)
        
        // Start "freshing" (that's refreshing the first time!).
        self.refreshControl!.beginRefreshing()
        self.loadTracks()
    }
    
    func loadTracks() {
        aura!.getTracks({ (tracks : [Track]) in
            self.tracks = tracks
            self.tableView.reloadData()
            self.refreshControl!.endRefreshing()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath) as TrackCell
        cell.track = self.tracks![indexPath.item]
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var track = tracks![indexPath.item]
        println("play", aura!.audioURL(track))
    }

}
