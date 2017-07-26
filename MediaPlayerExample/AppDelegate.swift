//
//  AppDelegate.swift
//  MediaPlayerExample
//
//  Created by Hashaam Siddiq on 6/13/17.
//  Copyright © 2017 Hashaam Siddiq. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // enable playback category: this is required for background audio to function normally
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(AVAudioSessionCategoryPlayback, mode: AVAudioSessionModeDefault)
        try? audioSession.setActive(true, with: [])
        
        return true
    }

}

