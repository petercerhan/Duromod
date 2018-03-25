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
    @IBOutlet var modulusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var scaleTagLabel: UILabel!
    @IBOutlet var hardnessTagLabel: UILabel!
    @IBOutlet var hardnessRangeLabel: UILabel!
    @IBOutlet var youngsTagLabel: UILabel!
    
    let scalesArray = DurometerModel.allScales
    
    var scale = DurometerModel.Scale.shore {
        didSet {
            recalculateModulus()
        }
    }
    var hardness: Double? {
        didSet {
            if hardness == 100 {
                modulusLabel.text = "Infinite"
            } else {
                recalculateModulus()
            }
        }
    }
    
    var keyboardIsRaised = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }

    @IBAction func updateScale() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ScaleViewController") as! ScaleViewController
        vc.selectedScale = scale
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func about() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "AboutNavigationViewController")
        present(vc, animated: true)
    }
    
    func recalculateModulus() {
        if let hardness = hardness {
            modulusLabel.text = DurometerModel(scale: scale).formattedModulus(forHardness: hardness)
        }
    }
    
    func configureUI() {
        title = "DuroMod"
        scaleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
        bottomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
        scaleTagLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
        hardnessTagLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
        hardnessRangeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
        youngsTagLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backgroundTouched)))
    }
    
    @objc func backgroundTouched() {
        if keyboardIsRaised {
            dismissKeyboard()
        }
    }
    
    //MARK: - Keyboard notifications
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        keyboardIsRaised = true
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        keyboardIsRaised = false
    }
    
}

//MARK: - ScaleViewControllerDelegate

extension HomeViewController: ScaleViewControllerDelegate {
    
    func dismiss(scale: DurometerModel.Scale) {
        self.scale = scale
        scaleLabel.text = scale.rawValue
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - UITextFieldDelegate

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func dismissKeyboard() {
        textField.resignFirstResponder()
        
        guard let text = textField.text, let hardness = Double(text) else {
            alert(message: "Hardness measurement must be a number")
            textField.text = "0"
            self.hardness = 0
            return
        }
    
        guard hardness >= 0 && hardness <= 100 else {
            alert(message: "Hardness measurement must be between 0 and 100")
            textField.text = "100"
            self.hardness = 100
            return
        }
        
        self.hardness = hardness
    }
}

//MARK: - Alert pop-up

extension HomeViewController {
 
    func alert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }
    
}


