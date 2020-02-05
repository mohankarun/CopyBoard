//
//  ClipBoard.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 6/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

class ClipBoard {
    
    private let pasteboard = NSPasteboard.general
    private let timeinverval = 0.5
    
    let defaults = UserDefaults.standard
    
    private var changeCount: Int
    
    private var history: [String] = []
    private var current: String = ""
    
//    var delegate: MenuDelegate!
    var menu: Menu!
    
    init() {
        defaults.set(5, forKey: "NoOfItems")
        changeCount = pasteboard.changeCount
        for element in pasteboard.pasteboardItems! {
            if let str = element.string(forType: NSPasteboard.PasteboardType(rawValue: "public.utf8-plain-text")) {
                history.append(str)
            }
        }
        if !history.isEmpty{
        current = history[0]
        }
        
        startListening()
    }
    
    func startListening() {
        Timer.scheduledTimer(timeInterval: timeinverval,
                             target: self,
                             selector: #selector(checkForChangesInPasteboard),
                             userInfo: nil,
                             repeats: true)
        
        
    }
   
    @objc
    func checkForChangesInPasteboard() {
        guard pasteboard.changeCount != changeCount else {
            return
        }
        let maxItems = defaults.integer(forKey: "NoOfItems") - 1 
        if let lastItem = pasteboard.pasteboardItems?.last {
            if let lastItemString = lastItem.string(forType: NSPasteboard.PasteboardType(rawValue: "public.utf8-plain-text")) {
                current = lastItemString
                if history.contains(lastItemString)
                {
                }
                else{
                    history.append(lastItemString)
                    menu.menuNeedsUpdate(_menu: menu)
                }

            }
        } else {
           current = ""
        }
        
        let currentSize = history.count
        
        
        if (currentSize > maxItems ){
            let remove = currentSize - maxItems
            history.removeFirst(remove)
            
        }
        
        changeCount = pasteboard.changeCount
        
        
        
    }
    
//    func setDelegate(delegate: MenuDelegate){
//        self.delegate = delegate
//    }
    
    func setMenu(menu: Menu){
        self.menu = menu
    }
    
    func  CurrentItem() -> String {
        
        return self.current
    }
    
    func  History() -> [String] {
        return self.history.reversed()
    }
    
    
    func copy(value: String){
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString(value, forType: NSPasteboard.PasteboardType.string)
        
    }
    
    func clear(){
        self.history = []
        self.current = ""
        menu.menuNeedsUpdate(_menu: menu)
    }
    
    
}
