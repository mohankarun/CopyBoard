//
//  AboutUrl.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 12/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

@IBDesignable
class AboutWindow: NSWindowController {
    

    
    override func close() {
        
    }
    
    @IBAction func closeWindow(_sender: NSWindow){
        print("Close Clicked")
    }
}
