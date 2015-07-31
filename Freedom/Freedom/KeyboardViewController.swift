//
//  KeyboardViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 6/3/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

protocol KeyboardViewControllerDelegate {
    
    func updateTotalString(totalStr: String)
    
    func finishRecord()
}

class KeyboardViewController: UIViewController {
    
    private var totalString: String = ""
    private var numberString: String = ""

    let caculator: CaculatorBrain = CaculatorBrain()
    
    var delegate: KeyboardViewControllerDelegate!
    
    @IBOutlet var keyboardBtns: [UIButton]!
    
    override func loadView() {
        NSBundle.mainBundle().loadNibNamed("KeyboardViewController", owner:self, options:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for btn in keyboardBtns {
            btn.addTarget(self, action: "keyboardAction:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
    点击键盘事件
    :param: sender
    */
    func keyboardAction(sender: UIButton) {
        println("\(sender.tag)")
        
        if sender.tag == 103 {            //完成
            delegate?.finishRecord()
            return
        }
        
        if (sender.tag > 0 && sender.tag < 10) {    //数字
            totalString += "\(sender.tag)"
            numberString += "\(sender.tag)"
            
        } else if sender.tag == 104 {       //小数点
            for char in totalString {
                if char == "." {
                    return
                }
            }
            totalString += "."
            numberString += "."

        } else if sender.tag == 100 {    // - 号键
            var numberStr = numberString as NSString
            caculator.pushNumber(numberStr.floatValue)
            caculator.pushOperator("-")
            totalString += "-"
            numberString = ""
            
        } else if sender.tag == 101 {     // + 号键
            var numberStr = numberString as NSString
            caculator.pushNumber(numberStr.floatValue)
            caculator.pushOperator("+")
            totalString += "+"
            numberString = ""
            
        } else if sender.tag == 103 {     //等号键
            var numberStr = numberString as NSString
            caculator.pushNumber(numberStr.floatValue)
            let result = caculator.getResult()
            totalString = "\(result)"
            numberString = "\(result)"
            caculator.clearNumberStack()
            caculator.clearOperatorStack()
            println("result: \(result)")
            
        } else  if sender.tag == 102 {     //撤销键
            totalString.removeAtIndex(totalString.startIndex)
            numberString.removeAtIndex(numberString.startIndex)
            
        } else if sender.tag == 105 {     //清空键
            caculator.clearNumberStack()
            caculator.clearOperatorStack()
            totalString = ""
            numberString = ""
        }
        
        self.delegate.updateTotalString(totalString)
    }
}
