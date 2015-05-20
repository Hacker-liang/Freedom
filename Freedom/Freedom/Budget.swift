//
//  Budget.swift
//  Freedom
//
//  Created by liangpengshuai on 5/19/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import Foundation
import CoreData

class Budget: NSManagedObject {

    @NSManaged var budgetId: String
    @NSManaged var budgetName: String
    @NSManaged var costMoney: NSNumber
    @NSManaged var createTime: NSNumber
    @NSManaged var cycleLength: NSNumber
    @NSManaged var isRepeat: NSNumber
    @NSManaged var isValid: NSNumber
    @NSManaged var totalMoney: NSNumber
    @NSManaged var type: NSNumber
    @NSManaged var childBudget: NSOrderedSet

}
