//
//  AboutViewController.swift
//  Duromod
//
//  Created by Peter Cerhan on 2/20/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet var doneButton: AnimatedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.backgroundColor = Colors.lightBlue
        
        textView.text = "\nDuroMod allows Young's modulus to be derived from the measured hardness of rubber and plastic polymers, and works for all 12 durometer scales that conform to ASTM D2240-05, or equivalent. DuroMod conversions were developed at the Rheology Research Center of the University of Wisconsin at Madison, and are based on linear elastic indentation mechanics. \n\nFor more detailed information, please refer to the following article published in the Journal of Testing and Evaluation: \n\n[Mix, A.W. and A.J. Giacomin, \"Standardized Polymer Durometry,\" Journal of Testing and Evaluation, 39(4), 1-10 (July, 2011).]"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    
}
