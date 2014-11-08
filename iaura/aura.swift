import Foundation

class Track {
    var title: String
    
    init(json: Dictionary<String, AnyObject>) {
        println(json)
        self.title = (json["title"] as? String)!
    }
}

class AURA {
    var baseURL: NSURL
    
    init(base: NSURL) {
        baseURL = base
    }
    
    func getTracks(handler : [Track] -> Void) {
        let url = baseURL.URLByAppendingPathComponent("tracks")
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url, completionHandler: { (data: NSData!, responsse: NSURLResponse!, error: NSError!) -> Void in
            println("did it!")
            var error: NSError?
            var tracks: [Track] = []
            let j: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error)
            if let rdict = j as? Dictionary<String, AnyObject> {
                let trackjs = rdict["tracks"] as? Array<Dictionary<String, AnyObject>>
                for trackj in trackjs! {
                    let track = Track(json: trackj)
                    tracks.append(track)
                }
            }
            handler(tracks)
        }).resume()
    }
}