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
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var scaleLabel: PaddedLabel!
    
    var scaleArray: [DurometerModel.Scale] = []
    var selectedScale: DurometerModel.Scale!
    var hasSetInitialSelection = false
    
    var delegate: ScaleViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        
        scaleLabel.text = selectedScale.rawValue
        scaleArray = buildScaleArray()
        doneButton.backgroundColor = Colors.darkBlue
    }

    @IBAction func done() {
        delegate.dismiss(scale: selectedScale)
    }
    
    func buildScaleArray() -> [DurometerModel.Scale] {
        var array = [selectedScale!]
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
        let bgColorView = UIView()

        bgColorView.backgroundColor = Colors.darkBlue
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scaleArray.count
    }
    
    //MARK:- TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedScale = scaleArray[indexPath.row]
        scaleLabel.text = selectedScale.rawValue
    }
    
}

protocol ScaleViewControllerDelegate {
    func dismiss(scale: DurometerModel.Scale)
}



