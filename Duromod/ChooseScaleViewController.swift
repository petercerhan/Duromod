//
//  ViewController.swift
//  Duromod
//
//  Created by Peter Cerhan on 1/29/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class ChooseScaleViewController: UIViewController, UITableViewDelegate {

    let scalesArray: [DurometerModel.Scale] = [.shore,
                                               .a,
                                               .b,
                                               .c,
                                               .d,
                                               .o,
                                               .do_,
                                               .oo,
                                               .m,
                                               .e,
                                               .ooo,
                                               .ooo_s,
                                               .cf]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(DurometerModel(scale: .a).getModulus(measuredHardness: 0.9))")
    }

}
