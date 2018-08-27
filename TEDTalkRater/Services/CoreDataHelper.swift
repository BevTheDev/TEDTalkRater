//
//  CoreDataHelper.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/26/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import CoreData
import DataManager

class CoreDataHelper {
    
    class func fetchRatedTalks() -> [TEDTalk]{
        
        let ratingSortDescriptor = NSSortDescriptor(key: #keyPath(TEDTalk.rating), ascending: false)
        let titleSortDescriptor = NSSortDescriptor(key: #keyPath(TEDTalk.titleText), ascending: true)
        
        return DataManager.fetchObjects(entity: TEDTalk.self, sortDescriptors: [ratingSortDescriptor, titleSortDescriptor], context: DataManager.mainContext)
    }
    
    class func fetchSavedRating(withTitle title: String) -> TEDTalk? {
        
        let predicate = NSPredicate(format: "%K == %@", #keyPath(TEDTalk.titleText), title)
        let fetchedResults = DataManager.fetchObjects(entity: TEDTalk.self, predicate: predicate, context: DataManager.mainContext)
        
        return fetchedResults.first
    }
    
    class func save() {
        
        DataManager.persist(synchronously: false)
    }
    
    class func reset() {
        
        DataManager.deleteAllObjects()
    }
}
