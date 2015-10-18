//
//  introMovieSw.swift
//  TabBarWithNav
//
//  Created by Sanzio on 25/09/15.
//  Copyright © 2015 Sanzio. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

@objc(introMovieSw) class introMovieSw: UIViewController {
        
        /// The player.
        var player : AVPlayer?

override func viewDidLoad() {
        super.viewDidLoad()

        let videoURL = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
        let player = AVPlayer(URL: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
        }
    
func readFileIntoAVPlayer() {
            
        let path = NSBundle.mainBundle().pathForResource("09GalleriadellaCupola", ofType:"mov")
        let videoURL = NSURL.fileURLWithPath(path!)
            
        let player = AVPlayer (URL: videoURL)

        player.play()
        }
}
