//
//  PreferencesWindow.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 7/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

class PreferencesWindow: NSWindowController {
    
    

    override func windowDidLoad() {
        super.windowDidLoad()
        
    }
    
    convenience init() {
        let MVC = preferencesController(nibName: nil, bundle: nil)
        self.init(window: NSWindow(contentViewController: MVC))
        window?.titleVisibility = .hidden;
        window?.titlebarAppearsTransparent = true;
    }
    
    override func close() {
        let application = NSApplication.shared
        application.abortModal()
        super.close()
    }
    
  
    
    
    

}
