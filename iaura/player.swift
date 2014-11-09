import Foundation
import AVFoundation

class AuraPlayer {
    var queuePlayer = AVQueuePlayer()
    var trackMap = [AVPlayerItem: Track]()
    var aura: AURA
    
    init(a: AURA) {
        aura = a
    }
    
    func play() {
        queuePlayer.play()
    }
    
    func pause() {
        queuePlayer.pause()
    }
    
    func playing() -> Bool {
        return queuePlayer.rate > 0.0
    }
    
    func enqueue(track: Track) {
        var url = aura.audioURL(track)
        var item = AVPlayerItem(URL: aura.audioURL(track))
        trackMap[item] = track
        queuePlayer.insertItem(item, afterItem: nil)
    }
    
    func tracks() -> [Track] {
        var t = [Track]()
        for obj in queuePlayer.items() {
            var item = obj as AVPlayerItem
            t.append(trackMap[item]!)
        }
        return t
    }
}