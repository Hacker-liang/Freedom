//
//  DayCostViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 5/19/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

class DayCostViewController: UIViewController, UINavigationControllerDelegate {
    
    var transitionPoint: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
        self.navigationController?.navigationBarHidden = true;
        
        var budgetManager = BudgetManager.shareInstance()
        var budget = budgetManager.createNewBudget()
        budget.budgetName = "test"
        budgetManager.saveBudgetChange()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.delegate = nil
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func budgetView(sender: AnyObject) {
        var budgetCtl = storyboard?.instantiateViewControllerWithIdentifier("budgetCtl") as! BudegtViewController
        transitionPoint = sender.center
        self.navigationController?.pushViewController(budgetCtl, animated: true)
    }

    //MARK:  UINavigationControllerDelegate
    
    func navigationController(_: UINavigationController, animationControllerForOperation _: UINavigationControllerOperation,
        fromViewController _: UIViewController, toViewController _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return CircularRevealTransitionAnimator(center: transitionPoint)
    }
}

