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
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var scaleTagLabel: UILabel!
    @IBOutlet var hardnessTagLabel: UILabel!
    @IBOutlet var hardnessRangeLabel: UILabel!
    @IBOutlet var youngsTagLabel: UILabel!
    
    let scalesArray = DurometerModel.allScales
    
    var scale = DurometerModel.Scale.shore
    var hardness: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print("\(DurometerModel(scale: .a).getModulus(measuredHardness: 0.9))")
    }

    @IBAction func updateScale() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ScaleViewController") as! ScaleViewController
        vc.selectedScale = scale
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func configureUI() {
        title = "Duromod"
        scaleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        bottomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        scaleTagLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        hardnessTagLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        hardnessRangeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        youngsTagLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
    }
}

extension HomeViewController: ScaleViewControllerDelegate {
    
    func dismiss(scale: DurometerModel.Scale) {
        self.scale = scale
        scaleLabel.text = scale.rawValue
        dismiss(animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func dismissKeyboard() {
        guard let text = textField.text, let hardness = Double(text) else {
            alert(message: "Hardness measurement must be a number")
            return
        }
    
        guard hardness >= 0 && hardness <= 100 else {
            alert(message: "Hardness measurement must be between 0 and 100")
            return
        }
        
        self.hardness = hardness
        //update modulus label
        
        textField.resignFirstResponder()
    }
}

extension HomeViewController {
 
    func alert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }
    
}


