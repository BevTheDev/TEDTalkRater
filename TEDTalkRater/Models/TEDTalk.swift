//
//  TEDTalk.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation

class TEDTalk: NSObject {
    
    let talkDescription: String
    let title: String
    
    init(title: String, talkDescription: String) {
        
        self.title = title
        self.talkDescription = talkDescription
        
        super.init()
    }
}
