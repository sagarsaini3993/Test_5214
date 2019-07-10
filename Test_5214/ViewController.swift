//
//  ViewController.swift
//  Test_5214
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    
    
    var arrImages : [String] = ["0","1", "2", "3"]
    var arrToFillWhenClicks : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if (WCSession.isSupported()) {
            print("PHONE: Phone supports WatchConnectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Phone does not support WatchConnectivity")
        }
        
        arrImages.shuffle()
        
        imgView1.image = UIImage(named: arrImages[1])
        imgView2.image = UIImage(named: arrImages[0])
        imgView3.image = UIImage(named: arrImages[3])
        imgView4.image = UIImage(named: arrImages[2])
        
        if arrToFillWhenClicks.count == 4 {
            
        }

    }
    
    //MARK: All button actions

    @IBAction func btn1Pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[0])!
        arrToFillWhenClicks.append(String(sender.tag))
//        print(sender.tag)
    }
    
    @IBAction func btn2pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[1])!
        arrToFillWhenClicks.append(String(sender.tag))
//        print(sender.tag)

    }
    @IBAction func btn3Pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[2])!
        arrToFillWhenClicks.append(String(sender.tag))
//        print(sender.tag)

    }
    @IBAction func btn4pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[3])!
        arrToFillWhenClicks.append(String(sender.tag))
//        print(sender.tag)

        self.sendData()
    }
    
    
    func sendData() {
        print(arrToFillWhenClicks)
        if (WCSession.default.isReachable) {
            
            
            let seq = ["sequence": arrToFillWhenClicks]
            // send the message to the watch
            WCSession.default.sendMessage(seq, replyHandler: nil)
            
        }
        else {
            print("PHONE: Cannot find the watch")
        }
    }
    
    // MARK: WCSession Delegates
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
}

