//
//  MenuItem.swift
//  CopyBoard
//
//  Created by Mohan Karunanidhi on 7/2/20.
//  Copyright © 2020 Mohan Karunanidhi. All rights reserved.
//

import Cocoa

class MenuItem: NSMenuItem {
    
    public var fullTitle = ""
    private let showMaxLength = 20
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String, action: Selector){
        super.init(title: title, action: action, keyEquivalent: "")
        self.title = humanizedTitle(title)
        self.fullTitle = title
        self.toolTip = title
    }
    
    private func humanizedTitle(_ title: String) -> String {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedTitle.count > showMaxLength {
            let index = trimmedTitle.index(trimmedTitle.startIndex, offsetBy: showMaxLength)
            return "\(trimmedTitle[...index])..."
        } else {
            return trimmedTitle
        }
    }

}
