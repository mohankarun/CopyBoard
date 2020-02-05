//
//  AppDelegate.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 6/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @objc public let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    private var  clipboard : ClipBoard!
    private var menu: Menu!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        clipboard = ClipBoard()
        statusItem.behavior = NSStatusItem.Behavior.removalAllowed
         if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("Clip"))
        }
        menu = Menu(clipboard: clipboard)
        clipboard.setMenu(menu: menu)
        statusItem.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        statusItem.isVisible = true
        return true
    }
    
    
    @objc
    func menuItemAction(_sender: MenuItem) {
        clipboard.copy(value: _sender.fullTitle)
    }
    
    @objc
    func clearboard(_sender: MenuItem) {
        clipboard.clear()

    }
    
    @IBAction func openPreferences(_sender: MenuItem){
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: "Preferences") as! NSWindowController
        
        if let wordCountWindow = wordCountWindowController.window {
            let application = NSApplication.shared
            application.runModal(for: wordCountWindow)
        
    }
}
    
    @IBAction func openAbout(_sender: MenuItem){
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: "About") as! NSWindowController
        
        if let wordCountWindow = wordCountWindowController.window {
            let application = NSApplication.shared
            application.runModal(for: wordCountWindow)
            
        }
    }

}

