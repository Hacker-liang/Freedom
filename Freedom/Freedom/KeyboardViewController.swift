//
//  KeyboardViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 6/3/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    
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
    }
    
   
}
