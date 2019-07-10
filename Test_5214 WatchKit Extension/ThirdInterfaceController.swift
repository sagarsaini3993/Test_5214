//
//  ThirdInterfaceController.swift
//  Test_5214
//
//  Created by MacStudent on 2019-07-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class ThirdInterfaceController: WKInterfaceController {
    
    var arrImages : [String] = ["0","1", "2", "3"]

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
        
        self.arrImages.shuffle()
        print(arrImages)
        
        imgView1.setImageNamed(arrImages[0])
        imgView2.setImageNamed(arrImages[1])
        imgView3.setImageNamed(arrImages[3])
        imgView4.setImageNamed(arrImages[2])
        
        

        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
