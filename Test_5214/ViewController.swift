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
    
    
    var arrImages : [Int] = [0, 1, 2, 3]
    var arrToFillWhenClicks : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrImages.shuffle()
        
        if (WCSession.isSupported()) {
            print("PHONE: Phone supports WatchConnectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Phone does not support WatchConnectivity")
        }
        
        imgView1.image = UIImage(named: "\(arrImages[0])")
        imgView2.image = UIImage(named: "\(arrImages[1])")
        imgView3.image = UIImage(named: "\(arrImages[2])")
        imgView4.image = UIImage(named: "\(arrImages[3])")

    }
    
    //MARK: All button actions

    @IBAction func btn1Pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[0])
        arrToFillWhenClicks.append(sender.tag)
        print(sender.tag)
        if arrToFillWhenClicks.count == 4 {
            self.sendData()
        }
    }
    
    @IBAction func btn2pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[1])
        arrToFillWhenClicks.append(sender.tag)
        print(sender.tag)

        if arrToFillWhenClicks.count == 4 {
            self.sendData()
        }

    }
    @IBAction func btn3Pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[2])
        arrToFillWhenClicks.append(sender.tag)
        print(sender.tag)

        if arrToFillWhenClicks.count == 4 {
            self.sendData()
        }

    }
    @IBAction func btn4pressed(_ sender: UIButton) {
        sender.tag = Int(arrImages[3])
        arrToFillWhenClicks.append(sender.tag)
        print(sender.tag)

        if arrToFillWhenClicks.count == 4 {
            self.sendData()
            print(arrImages)
        }
    }
    
    
    func sendData() {
        print(arrToFillWhenClicks)
        if (WCSession.default.isReachable) {
            
            let seq = ["sequence": arrToFillWhenClicks]
            print(seq)
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

