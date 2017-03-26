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
        
        doneButton.backgroundColor = Colors.darkBlue
        
        let text = "<br>DuroMod<span class='s2'><sup>TM</sup></span>, v. 1.1, Development MG, Minneapolis, MN (2017) <br><br>DuroMod allows Young's modulus to be derived from the measured hardness of rubber and plastics, and works for the Shore scale and for all 12 durometer scales that conform to ASTM D2240-05, or equivalent. DuroMod conversions were developed at the Rheology Research Center of the University of Wisconsin at Madison, and are based on linear elastic indentation mechanics [1]. <br><br>[1] Mix, A.W. and A.J. Giacomin, \"Standardized Polymer Durometry,\" <i>Journal of Testing and Evaluation</i>, <b>39</b>(4), 1-10 (July, 2011)."

        textView.setText(fromHTML: text)

    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    
}
