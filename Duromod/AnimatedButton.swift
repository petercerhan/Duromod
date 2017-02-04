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
    
    override func beginTracking(_ touch: UITouch, with withEvent: UIEvent?) -> Bool {
        backgroundColor = highlightedColor
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        backgroundColor = baseColor
    }
    
    override func cancelTracking(with event: UIEvent?) {
        backgroundColor = baseColor
    }
    
}
