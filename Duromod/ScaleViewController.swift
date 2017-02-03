//
//  ScaleViewController.swift
//  Duromod
//
//  Created by Peter Cerhan on 2/2/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var scaleArray: [DurometerModel.Scale] = []
    var selectedScale = DurometerModel.Scale.ooo
    var hasSetInitialSelection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        
        scaleArray = buildScaleArray()
        
    }

    func buildScaleArray() -> [DurometerModel.Scale] {
        var array = [selectedScale]
        for scale in DurometerModel.allScales {
            if scale != selectedScale {
                array.append(scale)
            }
        }
        return array
    }
    
}

extension ScaleViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- TableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 && !hasSetInitialSelection {
            let firstCellPath = tableView.indexPathForRow(at: CGPoint(x: CGFloat(0), y: CGFloat(0)))
            tableView.selectRow(at: firstCellPath, animated: false, scrollPosition: .none)
            hasSetInitialSelection = true
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Default")!
        cell.textLabel!.text = scaleArray[indexPath.row].rawValue
        //cell.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scaleArray.count
    }
    
    //MARK:- TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        
        
//        if indexPath.row == 0 && !hasSetInitialSelection {
//            cell.setSelected(true, animated: false)
//            hasSetInitialSelection = true
//        }
        
        print("index path \(indexPath)")
        
    }
    
}
