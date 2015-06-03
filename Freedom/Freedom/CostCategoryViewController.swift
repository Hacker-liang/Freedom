//
//  CostCategoryViewController.swift
//  Freedom
//
//  Created by liangpengshuai on 6/3/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

let dataSource:Array<String> = ["吃饭", "购物", "酒店", "打车", "吃饭", "购物", "酒店", "打车", "吃饭", "购物", "酒店", "打车", "吃饭", "购物", "酒店", "打车"]

class CostCategoryViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var scrollViewWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(self.view.bounds.size.width)")
        scrollViewWidth = self.view.bounds.size.width-40
        scrollView = UIScrollView(frame: CGRectMake(20, 80, scrollViewWidth, 120))
        scrollView.backgroundColor = UIColor.greenColor()
        scrollView.contentSize = CGSizeMake((self.view.bounds.size.width-40)*2, 120)
        scrollView.layer.cornerRadius = 3.0
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        self.refreshDataSource()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("\(self.view.bounds.size.width)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func refreshDataSource() {

        var width = Double(scrollView.bounds.size.width/5.0)
        for i in 0..<dataSource.count {
            var item = dataSource[i]
            var index: Int
            i > 9 ? (index = i - 10) : (index = i)
            var line = index/5
            var row = i%5
            i > 9 ? (row = 5+row) : (row = row)
            var button = UIButton(frame: CGRectMake(CGFloat(width * Double(row)), CGFloat(60 * line), CGFloat(width), CGFloat(60.0)))
            var title = dataSource[i]
            button.setTitle(title, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.tag = i
            scrollView.addSubview(button)
        }
    }
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}
