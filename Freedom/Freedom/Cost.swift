//
//  Cost.swift
//  Freedom
//
//  Created by liangpengshuai on 5/20/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import Foundation
import CoreData

class Cost: NSManagedObject {

    @NSManaged var costId: String
    @NSManaged var createTime: NSNumber
    @NSManaged var budgetId: String
    @NSManaged var type: NSNumber
    @NSManaged var value: NSNumber
    @NSManaged var lat: NSNumber
    @NSManaged var lng: NSNumber
    @NSManaged var note: String
    @NSManaged var metadataId: String
    @NSManaged var currency: NSNumber

}
