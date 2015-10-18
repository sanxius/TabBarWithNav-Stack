//
//  playMovieSwift.swift
//  TabBarWithNav
//
//  Created by  on 21/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

import UIKit
import MediaPlayer

@objc(playMovieSwift) class playMovieSwift: UIViewController {

    var moviePlayer: MPMoviePlayerController!
    var filmSelezionato: String?

    
    override func viewDidLoad() {
            super.viewDidLoad()
    print("effettuato viewDidLoad")
//    =filmSelezionato
//        playVideo()
    }
        
        // Do any additional setup after loading the view, typically from a nib.
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        //       // Dispose of any resources that can be recreated.
    }
    
//  func playVideo(nomeVideo: String) {
//      let path = NSBundle.mainBundle().pathForResource(nomeVideo, ofType:tipoVideo)
    
    func playVideo(movieSelect: String) {
        
        let moviePlaying = movieSelect

        print("effettuato playVideo")
        
//        let path = NSBundle.mainBundle().pathForResource("04SalaBevilacqua", ofType:"m4v")
        
//        let path = NSBundle.mainBundle().pathForResource(moviePlaying, ofType:"m4v")
        let path = NSBundle.mainBundle().pathForResource(moviePlaying, ofType:"3gp")
        if (path != nil){
        let url = NSURL.fileURLWithPath(path!)
        
        
        if let player = moviePlayer{
                stopPlayingVideo()
        }
        
        
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
 //  SZ-29/09         let player = moviePlayer
        
            if let player = moviePlayer {
                
                //NSNotificationCenter.defaultCenter().addObserver(self, selector: "videoHasFinishedPlaying:",  name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)

                //ridimensionare player e ficcare un UISegmented - Se stacco via PlayVideo() in ViewDidLoad è visibile
            
            //dimensionamento del Player
            player.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                
            //player.controlStyle = MPMovieControlStyle.Embedded

            player.view.frame = self.view.bounds
            player.shouldAutoplay=true
            player.prepareToPlay()
            player.scalingMode = .AspectFit
            player.backgroundView.hidden=true;
                
            //disabilita i controlli
  //          player.controlStyle = .None
            self.view.addSubview(player.view)
            player.setFullscreen(true, animated: false)
            player.play()
            NSLog("Finito di fare Play")

            
            }
        }
    }
        
    func stopPlayingVideo() {
        if let player = moviePlayer{ NSNotificationCenter.defaultCenter().removeObserver(self)
            player.stop()
            //player.view.removeFromSuperview()
        }
    }
    
}

