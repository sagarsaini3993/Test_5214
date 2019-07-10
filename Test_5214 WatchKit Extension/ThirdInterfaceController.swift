//
//  ThirdInterfaceController.swift
//  Test_5214
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class ThirdInterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    var arrImages : [Int] = [0,1, 2, 3]
    var arrShuffled : [String] = [""]
    var timer = Timer()

    @IBOutlet weak var imgView1: WKInterfaceImage!
    @IBOutlet weak var imgView2: WKInterfaceImage!
    @IBOutlet weak var imgView3: WKInterfaceImage!
    @IBOutlet weak var imgView4: WKInterfaceImage!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
//        WKInterfaceController.reloadRootPageControllers(withNames: ["ThirdInterfaceController"], contexts: nil, orientation: .vertical, pageIndex: 3)
        
        arrImages.shuffle()
        
        
                if (WCSession.isSupported()) {
                    print("Watch: Phone supports WatchConnectivity!")
                    let session = WCSession.default
                    session.delegate = self
                    session.activate()
                }
                else {
                    print("Watch: Phone does not support WatchConnectivity")
                }
        
//        arrImages.shuffle()
        print("WATCH : array after shuffle is \(arrImages)")
        
        imgView1.setImageNamed("\(arrImages[0])")
        imgView2.setImageNamed("\(arrImages[1])")
        imgView3.setImageNamed("\(arrImages[2])")
        imgView4.setImageNamed("\(arrImages[3])")
        
        if (UserDefaults.standard.object(forKey: "hard") == nil)  {
            
            // Code to remove images after few seconds
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                self.nilImages()
            }
            
        } else if (UserDefaults.standard.object(forKey: "soft") != nil){
            DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) { // Change `2.0` to the desired number of seconds.
                self.nilImages()
            }
        }
        
        
        
        
//        let data = UserDefaults.standard.stringArray(forKey: "dataToPass")
//        print("WATCH: Data in user defauts is : \(data!)")
        
//        if (UserDefaults.standard.data(forKey: "test") != nil) {
//            print("Not nil")
//        } else {
//            print("nil")
//        }
        
//        if (arrShuffled.count == 4) && (data?.count == 4) {
//            if arrShuffled[0] == data![0] {
//                print("win")
//            } else {
//                print("lose")
//            }
//        } else {
//            print("Array length is less than 4")
//        }
        
       
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("WATCH : Received data on 3rd screen is : \(String(describing: message["sequence"]!))")
        
        let arr:[Int] = message["sequence"]! as! [Int]
        print(arr)
        
        if arrImages[0] == arr[0] {
            if arrImages[1] == arr[1] {
                if arrImages[2] == arr[2] {
                    if arrImages[3] == arr[3] {
                        print("Win")
                        
                    } else {
                        print("Lose")
                    }
                } else {
                    print("Lose")
                }
            } else {
                print("Lose")
            }
        } else {
            print("Lose")
        }
        
        
//        if arrImages[0] == arr?[0] {
//            print("Win")
//        } else {
//            print("lose")
//        }
        
        
        
    }
    
    @objc func nilImages() {
        imgView1.setImageNamed(nil)
        imgView2.setImageNamed(nil)
        imgView3.setImageNamed(nil)
        imgView4.setImageNamed(nil)
    }

}
