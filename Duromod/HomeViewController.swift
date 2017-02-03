//
//  ViewController.swift
//  Duromod
//
//  Created by Peter Cerhan on 1/29/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
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
        print("\(DurometerModel(scale: .a).getModulus(measuredHardness: 0.9))")
    }

    @IBAction func updateScale() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ScaleViewController") as! ScaleViewController
        present(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- TableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Default")!
        cell.textLabel!.text = scalesArray[indexPath.row].rawValue
        //cell.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scalesArray.count
    }
    
    //MARK:- TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard!.instantiateViewController(withIdentifier: "MeasurementViewController") as! MeasurementViewController
//        vc.model = DurometerModel(scale: scalesArray[indexPath.row])
//        title = ""
//        navigationController!.pushViewController(vc, animated: true)
    }
   
    
}
