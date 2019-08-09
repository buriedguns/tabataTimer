//
//  ViewController.swift
//  tabataTimer
//
//  Created by Максим on 03/08/2019.
//  Copyright © 2019 Максим. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        preparingTF.delegate = self
        workTF.delegate = self
        restTF.delegate = self
        cycleTF.delegate = self
        setTF.delegate = self
        
        preparingTF.text = nil ?? "\(0)"
        workTF.text = nil ?? "\(0)"
        restTF.text = nil ?? "\(0)"
        cycleTF.text = nil ?? "\(0)"
        setTF.text = nil ?? "\(0)"
    }

    @IBOutlet weak var preparingTF: UITextField!
    @IBOutlet weak var workTF: UITextField!
    @IBOutlet weak var restTF: UITextField!
    @IBOutlet weak var cycleTF: UITextField!
    @IBOutlet weak var setTF: UITextField!
    
    @IBAction func minusPrepare(_ sender: UIButton) {
        if let currentPreparing = preparingTF.text{
            if currentPreparing == "" {
                preparingTF.text = "\(0)"
            }
            else if Int(currentPreparing)! > 0{
                preparingTF.text = "\(Int(currentPreparing)! - 1)"
            }
        }
    }

        
    @IBAction func plusPrepare(_ sender: UIButton) {
        if let currentPreparing = preparingTF.text{
            if currentPreparing == "" {
                preparingTF.text = "\(0)"
            }
            else if Int(currentPreparing)! >= 0 && Int(currentPreparing)! < 999{
                preparingTF.text = "\(Int(currentPreparing)! + 1)"
            }
        }
    }
    
    @IBAction func minusWork(_ sender: UIButton) {
        if let currentWork = workTF.text{
            if currentWork == "" {
                workTF.text = "\(0)"
            }
            else if Int(currentWork)! > 0{
                workTF.text = "\(Int(currentWork)! - 1)"
            }
        }
    }
    
    
    @IBAction func plusWork(_ sender: UIButton) {
        if let currentWork = workTF.text{
            if currentWork == "" {
                workTF.text = "\(0)"
            }
            else if Int(currentWork)! >= 0 && Int(currentWork)! < 999{
                workTF.text = "\(Int(currentWork)! + 1)"
            }
        }
    }
    
    @IBAction func minusRest(_ sender: UIButton) {
        if let currentRest = restTF.text{
            if currentRest == "" {
                restTF.text = "\(0)"
            }
            else if Int(currentRest)! > 0{
                restTF.text = "\(Int(currentRest)! - 1)"
            }
        }
    }
    
    
    @IBAction func plusRest(_ sender: UIButton) {
        if let currentRest = restTF.text{
            if currentRest == "" {
                restTF.text = "\(0)"
            }
            else if Int(currentRest)! >= 0 && Int(currentRest)! < 999{
                restTF.text = "\(Int(currentRest)! + 1)"
            }
        }
    }
    
    @IBAction func minusCycle(_ sender: UIButton) {
        if let currentCycle = cycleTF.text{
            if currentCycle == "" {
                cycleTF.text = "\(0)"
            }
            else if Int(currentCycle)! > 0{
                cycleTF.text = "\(Int(currentCycle)! - 1)"
            }
        }
    }
    
    
    @IBAction func plusCycle(_ sender: UIButton) {
        if let currentCycle = cycleTF.text{
            if currentCycle == "" {
                cycleTF.text = "\(0)"
            }
            else if Int(currentCycle)! >= 0 && Int(currentCycle)! < 999{
                cycleTF.text = "\(Int(currentCycle)! + 1)"
            }
        }
    }
    
    @IBAction func minusSet(_ sender: UIButton) {
        if let currentSet = setTF.text{
            if currentSet == "" {
                setTF.text = "\(0)"
            }
            else if Int(currentSet)! > 0{
                setTF.text = "\(Int(currentSet)! - 1)"
            }
        }
    }
    
    
    @IBAction func plusSet(_ sender: UIButton) {
        if let currentSet = setTF.text{
            if currentSet == "" {
                setTF.text = "\(0)"
            }
            else if Int(currentSet)! >= 0 && Int(currentSet)! < 999{
                setTF.text = "\(Int(currentSet)! + 1)"
            }
        }
    }
    @IBAction func startTimer(_ sender: UIButton) {
        performSegue(withIdentifier: "showTimer", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dvc = segue.destination as? TimerScene else { return }
        dvc.timerInfo = ["Prepare": "\(preparingTF.text ?? "0")", "Work": "\(workTF.text ?? "0")", "Rest": "\(restTF.text ?? "0")", "Cycle": "\(cycleTF.text ?? "0")", "Set": "\(setTF.text ?? "0")"]
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 3
    }
    
}

