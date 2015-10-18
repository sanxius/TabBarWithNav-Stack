//
//  TextControllerSwift.swift
//  TabBarWithNav
//
//  Created by  on 21/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

import UIKit

@objc(TextControllerSwift) class TextControllerSwift: UIViewController {
    
    var filmSelezionato: String?
//     var testoMuseo: UITextView!
    var textPlaying: String?

    @IBOutlet weak var testoMuseo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = false
        
        
        realPlay()
        print("effettuato viewDidLoad")

        //testoMuseo.scrollsToTop=true
        //testoMuseo.setContentOffset(CGPointZero, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    func playText(textSelect: String) {
        
        textPlaying = textSelect
     //   testoMuseo.resignFirstResponder()
     }
    
    //Do il tempo al segue di "svegliarsi"
    func realPlay(){
    var testoStanza: String?

    print("effettuato realPlay")
    
    let path = NSBundle.mainBundle().pathForResource(textPlaying, ofType:"txt")
    
    if (path != nil){
        //leggo il file
    do {
//    testoStanza = try String(contentsOfFile: path!)
    testoStanza = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        
    print(testoStanza!)
    }
    catch {/* ignoro in quanto file non trovato */}
    
    //testoMuseo.editable=true
    testoMuseo.selectable=true
    testoMuseo!.text=""
    //Nil - Significa che non l'abbiamo inizializzato
    
    //recuperato testo ora lo metto dentro il UIView di riferimento
    print(testoStanza!)
        testoMuseo.font = UIFont(name: "ArialMT", size: 24 )
        testoMuseo.text=testoMuseo.text.stringByAppendingString(String(testoStanza!))

        print(testoMuseo!.text)
        testoMuseo.setContentOffset(CGPointZero, animated: true)
        testoMuseo.scrollsToTop=true
        
    testoMuseo.selectable=false
    }
}
}

