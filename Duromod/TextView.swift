//
//  TextView.swift
//  Duromod
//
//  Created by Peter Cerhan on 3/22/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

extension UITextView {
    
    func setText(fromHTML htmlString: String) {
        
        var formattedString: NSMutableAttributedString?
        
        let startString = "<html><head><style type='text/css'>span.s1 { font-family: '-apple-system', 'HelveticaNeue'; font-weight: normal; font-style: normal; font-size: \(self.font!.pointSize * 0.75)pt} span.s2 { font-weight: normal; font-style: normal; font-size: \(self.font!.pointSize * 0.75 * 0.8)pt}</style></head><span class='s1'>"
        let endString = "</span></html>"
        
        if let data = (startString + htmlString + endString).data(using: .utf8) {
            do {
                formattedString = try NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            }
            catch {
                print("error creating attributed string")
            }
        }
        
        
        if let formattedString = formattedString {
            self.attributedText = formattedString
        } else {
            self.attributedText = NSAttributedString()
        }
        
    }
    
}
