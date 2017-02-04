//
//  AnimatedButton.swift
//  OnTheMap
//
//  Created by Peter Cerhan on 1/25/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class AnimatedButton: UIButton {
    
    var baseColor = Colors.lightBlue
    var highlightedColor = Colors.shadedLightBlue
    
    var titleOffset = UIEdgeInsetsMake(CGFloat(5.0), CGFloat(5.0), CGFloat(0.0), CGFloat(0.0))
    var zeroOffset = UIEdgeInsetsMake(CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
    
    override func beginTracking(_ touch: UITouch, with withEvent: UIEvent?) -> Bool {
        backgroundColor = highlightedColor
        titleEdgeInsets = titleOffset
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        backgroundColor = baseColor
        titleEdgeInsets = zeroOffset
    }
    
    override func cancelTracking(with event: UIEvent?) {
        backgroundColor = baseColor
        titleEdgeInsets = zeroOffset
    }
    
}
