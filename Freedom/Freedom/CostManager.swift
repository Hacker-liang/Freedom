//
//  CostManager.swift
//  Freedom
//
//  Created by liangpengshuai on 5/20/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit
import CoreData

private let costManager = CostManager()

class CostManager: NSObject {
    private let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    class func shareInstance() -> CostManager {
        return costManager
    }
    
    func createNewCost() -> Cost {
        let cost = NSEntityDescription.insertNewObjectForEntityForName("Cost", inManagedObjectContext: managedObjectContext!) as! Cost
        cost.costId = NSUUID().UUIDString
        return cost
    }
    
    func saveCost(cost: Cost) {
        self.saveCostChange()
    }
    
    func removeCost(#costId: String) {
        
    }
    
    func getCostList(#fromTime: NSTimeInterval, toTime: NSTimeInterval) -> Array<Cost> {
        return Array<Cost>()
    }
    
    func getAllCost() -> Array<Cost> {
        let request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName("Cost", inManagedObjectContext: managedObjectContext!)
        var objs = self.managedObjectContext!.executeFetchRequest(request, error: nil)
        return objs as!  Array<Cost>
    }
    
    func saveCostChange() {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    

}
