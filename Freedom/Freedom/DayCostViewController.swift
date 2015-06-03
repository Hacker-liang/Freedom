//
//  DayCostViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 5/19/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit
import CoreData

class DayCostViewController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    var headerView: DayCostHeaderView!
    var fakeBackGroundView: UIView!
    var dataSource: Array<Cost>!
    
    var transitionPoint: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshDataSource()
        self.navigationController?.delegate = self
        fakeBackGroundView = UIView(frame: CGRectMake(0, 175, self.view.bounds.size.width, self.view.bounds.size.height-175))
        fakeBackGroundView.backgroundColor = UIColor.whiteColor()
        self.backGroundImageView.addSubview(fakeBackGroundView)
        headerView = DayCostHeaderView(frame: CGRectMake(0, 0, self.view.bounds.size.width, 175))
        var fakeHeaderView = UIView(frame: CGRectMake(0, 0, self.view.bounds.size.width, 111))
        tableView.tableHeaderView = fakeHeaderView
        tableView.delegate = self
        tableView.dataSource = self
        self.backGroundImageView.addSubview(headerView)
        self.tableView.backgroundColor = UIColor(red: 254, green: 254, blue: 254, alpha: 0)
        tableView.registerNib(UINib(nibName: "DayCostTableViewCell", bundle: nil), forCellReuseIdentifier: "dayCostCell")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshDataSource", name: "updateDataSource", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
        self.navigationController?.navigationBarHidden = true;
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.delegate = nil
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func refreshDataSource() {
        var costManager = CostManager()
        dataSource = costManager.getAllCost()
        self.tableView.reloadData()
    }
    
    private func showRecordCtl() {
        var recordCtl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RecordMoneyViewController") as! UIViewController
        recordCtl.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
//        var naviCtl = UINavigationController(rootViewController: recordCtl)
        self.presentViewController(recordCtl, animated: true) { () -> Void in
            
        }
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
    
    //MARK: UITableviewDatasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cost = dataSource[indexPath.row]
        var cell: DayCostTableViewCell = tableView.dequeueReusableCellWithIdentifier("dayCostCell", forIndexPath: indexPath) as! DayCostTableViewCell
        cell.textLabel?.text = cost.note
        return cell
    }
    

    //MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetY = tableView.contentOffset.y

        if offsetY < -60 {
            self.showRecordCtl()
            return
        }
        var y = 175 - offsetY
        if y < 64 {
            y = 64
        }
        var frame = CGRectMake(0, y, self.view.bounds.size.width ,self.view.bounds.size.height-y)
        fakeBackGroundView.frame = frame
        headerView.updateHeaderView(contentOffsetY: offsetY)
    }

    
    
    
    
}

