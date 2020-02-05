//
//  AboutController.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 11/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

class AboutController: NSViewController {
    
    @IBOutlet  var okButton: NSButton!
    @IBOutlet  var sourceButton: NSButton!
    @IBOutlet var textView: NSTextField!
    
    private var sourceCode = "https://github.com/mohankarun/CopyBoard";
    


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func handleClicked(_sender: NSButton){
        
        print("\(_sender.title)");
        let title = _sender.title
        if (title == "Source Code") {
        let url = URL(string: sourceCode)!
        if NSWorkspace.shared.open(url) {
            print("Url opened")
            
        }
        }
        
        let application = NSApplication.shared
        application.abortModal()
        self.view.window?.close()

    }
    
    
}
