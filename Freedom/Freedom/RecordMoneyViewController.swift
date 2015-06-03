//
//  RecordMoneyViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 5/29/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

class RecordMoneyViewController: UIViewController {

    var backGroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var backBtn = UIButton(frame: CGRectMake(0, 0, 40, 30))
//        backBtn.setTitle("Back", forState: UIControlState.Normal)
//        backBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        backBtn.addTarget(self, action: "backTo:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        backGroundImageView = UIImageView(frame: self.view.bounds)
        backGroundImageView.image = UIImage(named: "1242.png")
        self.view.addSubview(backGroundImageView)
        self.addKeyboardView()
        self.addCostCategoryView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardView()

    }
    
    private func addKeyboardView() {
        var keyboardCtl = KeyboardViewController()
        self.addChildViewController(keyboardCtl)
        keyboardCtl.view.frame = CGRectMake(0, self.view.bounds.size.height-212, self.view.bounds.size.width, 212)
        self.view.addSubview(keyboardCtl.view)
    }
    
    private func addCostCategoryView() {
        var costCategoryView = CostCategoryViewController()
        self.addChildViewController(costCategoryView)
        costCategoryView.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 240)
        self.view.addSubview(costCategoryView.view)
    }

    func backTo(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func createCostRecord(sender: AnyObject) {
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
