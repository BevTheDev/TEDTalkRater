//
//  RatedTalk.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/25/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import CoreData
import DataManager

@objc(RatedTalk)
public class RatedTalk: NSManagedObject {
    
    convenience init(title: String, description: String, presenter: String, rating: Double) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "RatedTalk", in: DataManager.mainContext) else {
            
            fatalError("Entity creation failed")
        }
        
        self.init(entity: entity, insertInto: DataManager.mainContext)
        
        self.titleText = title
        self.descriptionText = description
        self.presenter = presenter
        self.rating = Int16(rating)
    }
}
