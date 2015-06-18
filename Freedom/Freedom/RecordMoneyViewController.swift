//
//  RecordMoneyViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 5/29/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

protocol RecordMoneyViewControllerDelegate {
    
}

class RecordMoneyViewController: UIViewController, KeyboardViewControllerDelegate {

    var backGroundImageView: UIImageView!
    var keyboardCtl: KeyboardViewController!
    
    var costLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundImageView = UIImageView(frame: self.view.bounds)
        backGroundImageView.image = UIImage(named: "1242.png")
        self.view.addSubview(backGroundImageView)
        costLabel = UILabel(frame: CGRectMake(20, 20, self.view.bounds.size.width-40, 70))
        costLabel.backgroundColor = UIColor.whiteColor()
        costLabel.textAlignment = NSTextAlignment.Right
        
        self.view.addSubview(costLabel)
        self.addKeyboardView()
        self.addCostCategoryView()
        
        let gesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        self.view.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardView()
    }
    
    private func addKeyboardView() {
        keyboardCtl = KeyboardViewController()
        keyboardCtl.delegate = self
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

    func backTo() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func handlePan(gesture: UIPanGestureRecognizer) {
        let point = gesture.translationInView(self.view)
        if point.y < -180 {
            self.backTo()
        }
    }
    
    func createCostRecord(sender: AnyObject) {
        var costManager = CostManager()
        var cost = costManager.createNewCost()
        cost.createTime = NSDate().timeIntervalSince1970
        cost.note = "测试 cost : \(NSDate().timeIntervalSince1970)"
        costManager.saveCostChange()
    }
    
    // MARK: KeyboardViewControllerDelegate
    
    func updateTotalString(totalStr: String) {
        costLabel.text = totalStr
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
