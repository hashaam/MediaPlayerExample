//
//  ViewController.swift
//  MediaPlayerExample
//
//  Created by Hashaam Siddiq on 6/13/17.
//  Copyright © 2017 Hashaam Siddiq. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupRemoteCommandCenter(enable: Bool) {
        
        let remoteCommandCenter = MPRemoteCommandCenter.shared()
        
        if enable {
            
            remoteCommandCenter.pauseCommand.addTarget(self, action: #selector(remoteCommandCenterPauseCommandHandler))
            remoteCommandCenter.playCommand.addTarget(self, action: #selector(remoteCommandCenterPlayCommandHandler))
            remoteCommandCenter.stopCommand.addTarget(self, action: #selector(remoteCommandCenterStopCommandHandler))
            remoteCommandCenter.togglePlayPauseCommand.addTarget(self, action: #selector(remoteCommandCenterPlayPauseCommandHandler))
            
        } else {
            
            remoteCommandCenter.pauseCommand.removeTarget(self, action: #selector(remoteCommandCenterPauseCommandHandler))
            remoteCommandCenter.playCommand.removeTarget(self, action: #selector(remoteCommandCenterPlayCommandHandler))
            remoteCommandCenter.stopCommand.removeTarget(self, action: #selector(remoteCommandCenterStopCommandHandler))
            remoteCommandCenter.togglePlayPauseCommand.removeTarget(self, action: #selector(remoteCommandCenterPlayPauseCommandHandler))
            
        }
        
        remoteCommandCenter.pauseCommand.isEnabled = enable
        remoteCommandCenter.playCommand.isEnabled = enable
        remoteCommandCenter.stopCommand.isEnabled = enable
        remoteCommandCenter.togglePlayPauseCommand.isEnabled = enable
        
    }
    
    deinit {
        
        setupRemoteCommandCenter(enable: false)
        
    }
    
    func remoteCommandCenterPauseCommandHandler() {
        
        // handle pause
        player?.pause()
        
    }
    
    func remoteCommandCenterPlayCommandHandler() {
        
        // handle play
        player?.play()
        
    }
    
    func remoteCommandCenterStopCommandHandler() {
        
        // handle stop
        player?.pause()
        
    }
    
    func remoteCommandCenterPlayPauseCommandHandler() {
        
        // handle play pause
        if player?.rate == 0.0 {
            player?.play()
        } else {
            player?.pause()
        }
        
    }
    
    func setupNowPlayingInfo() {
        
        let image = #imageLiteral(resourceName: "artwork")
        let mediaArtwork = MPMediaItemArtwork(boundsSize: image.size) { (size: CGSize) -> UIImage in
            return image
        }
        
        let nowPlayingInfo: [String: Any] = [
            MPMediaItemPropertyArtist: "hashaam.com",
            MPMediaItemPropertyTitle: "Live Streaming Example",
            MPMediaItemPropertyArtwork: mediaArtwork,
            MPNowPlayingInfoPropertyIsLiveStream: true
        ]
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        
    }
    
    func setupPlayer() {
        
        let streamURL = URL(string: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8")!
        self.player = AVPlayer(url: streamURL)
        self.player?.play()
        
    }
    
    @IBAction func playButtonHandler(btn: UIButton) {
        
        setupRemoteCommandCenter(enable: true)
        
        setupPlayer()
        
        setupNowPlayingInfo()
        
    }

}

