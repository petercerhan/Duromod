//
//  ViewController.swift
//  Duromod
//
//  Created by Peter Cerhan on 1/29/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var scaleLabel: UILabel!
    
    let scalesArray = DurometerModel.allScales
    
    var scale = DurometerModel.Scale.shore
    var hardness = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Duromod"
        print("\(DurometerModel(scale: .a).getModulus(measuredHardness: 0.9))")
    }

    @IBAction func updateScale() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ScaleViewController") as! ScaleViewController
        vc.selectedScale = scale
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension HomeViewController: ScaleViewControllerDelegate {
    
    func dismiss(scale: DurometerModel.Scale) {
        self.scale = scale
        scaleLabel.text = scale.rawValue
        dismiss(animated: true, completion: nil)
    }
    
}

