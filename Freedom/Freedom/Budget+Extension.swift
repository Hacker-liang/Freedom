//
//  Budget+Extension.swift
//  Freedom
//
//  Created by liangpengshuai on 5/19/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import Foundation

enum BudgetType: Int {
    case Total = 1
    case Food = 2
}

extension Budget {
    func addChildBudget(budget: Budget) {
        var items = self.mutableSetValueForKey("childBudget");
        items.addObject(budget)
    }
    
    func removeChildBudget(budget: Budget) {
        var items = self.mutableSetValueForKey("childBudget");
        items.removeObject(budget)
    }
    
}