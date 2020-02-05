//
//  Menu.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 6/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

class Menu: NSMenu,NSMenuDelegate {
    
    public let menuWidth = 200
    
    private var clipboard: ClipBoard!
    private var historyMenu = NSMenu()
    let historyItem = NSMenuItem(title: "History", action:nil,keyEquivalent: "")
    let quitItem = NSMenuItem(title: "Quit", action:#selector(NSApplication.terminate(_:)),keyEquivalent: "")
    let clearItem = NSMenuItem(title: "Clear", action:#selector(AppDelegate.clearboard),keyEquivalent: "")
    let prefItem = NSMenuItem(title: "Preferences", action:#selector(AppDelegate.openPreferences),keyEquivalent: "")
    let abouttItem = NSMenuItem(title: "About", action:#selector(AppDelegate.openAbout),keyEquivalent: "")
    private var currentItem =  NSMenuItem()
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
    }
    
    init(clipboard: ClipBoard) {
        super.init(title: "CopyBoard")
        super.delegate = self
        self.minimumWidth = CGFloat(menuWidth)
        self.clipboard = clipboard
        populateMenuItems(_menu: self)
        
    }
    
    func menuNeedsUpdate(_menu: NSMenu) {
        super.removeAllItems()
        populateMenuItems(_menu: self)
    }
    
    
    func populateMenuItems(_menu: NSMenu){
        if self.clipboard.CurrentItem().isEmpty {
        currentItem = MenuItem(title: "<clipboard empty>", action:"")
        }
        else
        {
        currentItem = MenuItem(title: self.clipboard.CurrentItem(), action:#selector(AppDelegate.menuItemAction))
        }
        super.addItem(currentItem);
        
        if self.clipboard.History().isEmpty {
            let disabledhistoryItem = MenuItem(title: "History", action:"")
            super.addItem(disabledhistoryItem)
        }
        else {
        super.addItem(historyItem)
        }
        historyMenu.removeAllItems()
        
        for element in clipboard.History() {
            historyMenu.addItem(MenuItem(title: element,action: #selector(AppDelegate.menuItemAction)))
        }
        
        super.setSubmenu(historyMenu, for: historyItem);
        
        super.addItem(NSMenuItem.separator())
        super.addItem(clearItem)
        super.addItem(prefItem)
        super.addItem(abouttItem)
        super.addItem(quitItem);
        
    }
   
    
    

}
