//
//  ViewController.swift
//  Duromod
//
//  Created by Peter Cerhan on 1/29/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class ChooseScaleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
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
        title = "Duromod"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
            
        print("\(DurometerModel(scale: .a).getModulus(measuredHardness: 0.9))")
    }

}

extension ChooseScaleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Default")!
        //cell.textLabel!.text = "Hello World"
        cell.textLabel!.text = scalesArray[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scalesArray.count
    }
    
    
}
