import UIKit

class TracksViewController: UITableViewController {
    var aura: AURA?
    var tracks: [Track]?

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func showSetting(sender: AnyObject) {
        println("settings")
    }
    
    func mainController() -> ConnectedViewController {
        return navigationController as ConnectedViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // TODO dispose of the tracks array
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
        mainController().enqueue(track)
    }

}
