//
//  DayCostHeaderView.swift
//  Freedom
//
//  Created by liangpengshuai on 5/29/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

let progressViewMinCenterY: CGFloat = 44.0
let progressViewMaxCenterY: CGFloat = 87.5


class DayCostHeaderView: UIView {
    
    var progressValue: CGFloat {
        set {
            progressView.progress = 0.5
        }
        get {
            return progressView.progress
        }
    }
    
    var progressView: UAProgressView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        progressView = UAProgressView(frame: CGRectMake(0, 0, 70, 70))
        progressView.lineWidth = 4.0
        progressView.borderWidth = 0.0
        progressValue = 0.55
        progressView.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        progressView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        
        var view = UIView(frame: CGRectMake(0, 0, 66, 66))
        view.backgroundColor = UIColor.redColor()
        view.layer.cornerRadius = 33
        progressView.centralView = view
        
        self.addSubview(progressView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateHeaderView(#contentOffsetY: CGFloat) {
        if contentOffsetY > 0 {
            var ratio = contentOffsetY / (progressViewMaxCenterY - progressViewMinCenterY)
            if ratio > 1 {
                ratio = 1
            }
            var widthRatioOne = 35.0 * ratio
            var widthRatioTwo = 33.0 * ratio

            var offsetY = self.frame.size.height/2 - contentOffsetY
            var frame = CGRectMake(0, 0, 70-widthRatioOne, 70-widthRatioOne)
            var centreViewFrame = CGRectMake(0, 0, 66-widthRatioTwo, 66-widthRatioTwo)
            progressView.frame = frame
            progressView.centralView.frame = centreViewFrame
            progressView.centralView.layer.cornerRadius = (66-widthRatioTwo)/2
            var centerY = self.frame.size.height/2 - contentOffsetY
            if centerY < progressViewMinCenterY {
                centerY = progressViewMinCenterY
            }
            progressView.center = CGPoint(x: self.frame.size.width/2, y: centerY)
        }
    }

    
    

}
