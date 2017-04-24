//
//  SideBar.swift
//  goodAgentiOS
//
//  Created by Junmo Kang on 24/04/2017.
//  Copyright © 2017 Kalabash Inc. All rights reserved.
//

import UIKit

class SideBar: UIView {
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SideBar", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
