//
//  RatedTalk+CoreDataProperties.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/25/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import CoreData

extension RatedTalk {
    
    @NSManaged public var titleText: String
    @NSManaged public var descriptionText: String
    @NSManaged public var presenter: String
    @NSManaged public var rating: Int16
}
