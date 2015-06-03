//
//  CostItem.swift
//  Freedom
//
//  Created by liangpengshuai on 6/3/15.
//  Copyright (c) 2015 com.lps.www. All rights reserved.
//

import UIKit

class CostItem: UIButton {

    override func layoutSubviews() {
        if let imageView = self.imageView {
            var center = imageView.center
            center.x = self.frame.size.width/2
            center.y = imageView.frame.size.height/2.0
            self.imageView?.center = center
        }
        
        if let titleLabel = self.titleLabel {
            var farme = self.titleLabel?.frame
            farme!.origin.x = 0;
            var y = self.imageView!.frame.size.height + self.imageView!.frame.origin.y
            frame.origin.y = y
            farme!.size.width = self.frame.size.width;
            self.titleLabel?.frame = frame
            self.titleLabel?.textAlignment = NSTextAlignment.Center
        }
    }
}
