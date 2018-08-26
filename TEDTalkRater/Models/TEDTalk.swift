//
//  TEDTalk.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/25/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import CoreData
import DataManager

@objc(TEDTalk)
public class TEDTalk: NSManagedObject {
    
    convenience init(title: String, description: String, presenter: String, rating: Double, context: NSManagedObjectContext? = nil) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TEDTalk", in: DataManager.mainContext) else {
            
            fatalError("Entity creation failed")
        }
        
        self.init(entity: entity, insertInto: context)
        
        self.titleText = title
        self.descriptionText = description
        self.presenter = presenter
        self.rating = Int16(rating)
    }
}
