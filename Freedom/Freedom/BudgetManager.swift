//
//  BudgetManager.swift
//  Freedom
//
//  Created by liangpengshuai on 5/19/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit
import CoreData

let budgetManager = BudgetManager()

class BudgetManager: NSObject {
    
    private let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    class func shareInstance() -> BudgetManager {
        return budgetManager
    }
    
    var currentBudget: Budget? {
        get {
            var error = NSErrorPointer()
            var request = NSFetchRequest()
            let predicate = NSPredicate(format: "isValid == %@", true)

            request.predicate = predicate
            request.entity = NSEntityDescription.entityForName("Budget", inManagedObjectContext: self.managedObjectContext!)
            var objs = self.managedObjectContext!.executeFetchRequest(request, error: error)
            return objs?.first as? Budget
        }
    }
   
    func createNewBudget() -> NSManagedObject {
        let budget = NSEntityDescription.insertNewObjectForEntityForName("Budget", inManagedObjectContext: managedObjectContext!) as! Budget
        budget.budgetId = NSUUID().UUIDString
        self.managedObjectContext?.save(nil)
        return budget
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}












