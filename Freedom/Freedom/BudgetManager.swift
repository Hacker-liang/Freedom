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
   
    func getBudget(#budgetId: String) -> Budget? {
        let predicate = NSPredicate(format: "budgetId == %@", budgetId)
        let request = NSFetchRequest()
        request.predicate = predicate
        request.entity = NSEntityDescription.entityForName("Budget", inManagedObjectContext: managedObjectContext!)
        var objs = self.managedObjectContext!.executeFetchRequest(request, error: nil)
        return objs?.first as? Budget
    }
    
    func createNewBudget() -> Budget {
        let budget = NSEntityDescription.insertNewObjectForEntityForName("Budget", inManagedObjectContext: managedObjectContext!) as! Budget
        budget.budgetId = NSUUID().UUIDString
        return budget
    }
    
    func saveBudgetChange() {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    
    /**
    删除一个 budget
    
    :param: budgetId
    */
    func deleteBugget(budgetId: String) {
        if let budget = self.getBudget(budgetId: budgetId) {
//            managedObjectContext?.deleteObject(budget)

        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}












