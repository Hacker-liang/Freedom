//
//  CostManager.swift
//  Freedom
//
//  Created by liangpengshuai on 5/20/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

private let costManager = CostManager()

class CostManager: NSObject {
    private let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    class func shareInstance() -> CostManager {
        return costManager
    }
    

}
