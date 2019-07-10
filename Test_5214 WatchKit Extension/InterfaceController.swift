//
//  InterfaceController.swift
//  Test_5214 WatchKit Extension
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func btnPressedEnterName() {
        
        presentTextInputController(withSuggestions: [""], allowedInputMode: .plain) { (results) in
            
            if (results != nil && results!.count > 0) {
                // 2. write your code to process the person's response
                let userResponse = results?.first as? String
                //                self.responseLabel.setText(userResponse)
                print(userResponse!)
                UserDefaults.standard.set(userResponse, forKey: "name")
            }
            
            
            self.pushController(withName: "mySegue", context: nil)
            
        }
        
    }
}
