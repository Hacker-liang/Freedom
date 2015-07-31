//
//  CaculatorBrain.swift
//  Freedom
//
//  Created by liangpengshuai on 6/8/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

class CaculatorBrain: NSObject {
    
    var numberStack: Array<Float> = Array()
    var operatorStack: Array<String> = Array()
    
    func pushNumber(number: Float) {
        numberStack.append(number)
    }
    
    func pushOperator(ope: String) {
        operatorStack.append(ope)
    }
    
    func getResult() -> Float {
        if numberStack.count == 1 {
            return numberStack.first!
        } else if numberStack.count == 0 {
            return 0
        } else {
            return self.getOperatorResult()
        }
    }
    
    func clearOperatorStack() {
        self.numberStack.removeAll(keepCapacity: false)
    }
    
    func clearNumberStack() {
        self.operatorStack.removeAll(keepCapacity: false)
    }
    
    private func getOperatorResult() -> Float {
        var result: Float = numberStack.first!
        var printStr = "\(result)"

        for i in 0 ..< operatorStack.count {
            var secondNum = numberStack[i+1]
            var oper = operatorStack[i]
            
            printStr += "\(oper) \(secondNum)"

            switch oper {
            case "+" :
                result += secondNum
                
            case "-" :
                result -= secondNum
                
            default :
                break
            }
        }
        
        printStr += "= \(result)"
        println("\(printStr)")

        return result
    }
   
}









