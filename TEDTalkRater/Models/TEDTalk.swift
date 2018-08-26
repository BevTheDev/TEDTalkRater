//
//  TEDTalk.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation

class TEDTalk: NSObject {
    
    let descriptionText: String
    let titleText: String
    let presenter: String
    
    init(title: String, description: String, presenter: String) {
        
        self.titleText = title
        self.descriptionText = description
        self.presenter = presenter
        
        super.init()
    }
}
