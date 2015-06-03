//
//  RecordMoneyViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 5/29/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

class RecordMoneyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createCostRecord(sender: AnyObject) {
        var costManager = CostManager()
        var cost = costManager.createNewCost()
        cost.createTime = NSDate().timeIntervalSince1970
        cost.note = "测试 cost : \(NSDate().timeIntervalSince1970)"
        costManager.saveCostChange()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
