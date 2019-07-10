//
//  SecondInterfaceController.swift
//  Test_5214 WatchKit Extension
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class SecondInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        var name = UserDefaults.standard.string(forKey: "name")
        print(name)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
