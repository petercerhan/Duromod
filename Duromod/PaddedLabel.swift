//
//  PaddedLabel.swift
//  Duromod
//
//  Created by Peter Cerhan on 2/4/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

@IBDesignable class PaddedLabel: UILabel {

    @IBInspectable var verticalContentPadding: Double = 0
    @IBInspectable var horizontalContentPadding: Double = 0
    
    override public var intrinsicContentSize: CGSize {
        get {
            let contentSize = super.intrinsicContentSize
            return CGSize(width: contentSize.width + CGFloat(horizontalContentPadding), height: contentSize.height + CGFloat(verticalContentPadding))
        }
    }

}
