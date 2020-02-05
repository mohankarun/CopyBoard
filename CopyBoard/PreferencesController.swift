//
//  ViewController.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 6/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

class preferencesController: NSViewController {
    
     @IBOutlet weak var preferencesSave: NSButton!
    
     @IBOutlet  var preferencesItemSize: NSTextField!
    var defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let val = defaults.integer(forKey: "NoOfItems")
        preferencesItemSize.intValue = Int32(val)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func handlePreferencesClicked(_ sender: Any) {
        
        let value = preferencesItemSize.intValue
        defaults.set(value, forKey: "NoOfItems")
      
        print("Hisory Updated: \(defaults.integer(forKey: "NoOfItems"))")
        let application = NSApplication.shared
        application.abortModal()
        self.view.window?.windowController?.close()
        
        
    }


}

