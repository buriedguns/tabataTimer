//
//  TimerScene.swift
//  tabataTimer
//
//  Created by Максим on 04/08/2019.
//  Copyright © 2019 Максим. All rights reserved.
//
import UIKit

class TimerScene: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var preparingLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var cycleLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    
    var timerInfo: Dictionary<String, String>!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseTimerBTN: UIButton!
    
    var timer = Timer()
    var isTimerOn = true
    var completedCycles = 0
    var completedSets = 0
    var prepareTime = 0
    var workTime = 0
    var restTime = 0
    
    var pauseIMG = UIImage(named: "pause-squared")
    var resumeIMG = UIImage(named: "start")
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        isTimerOn.toggle()
        if isTimerOn {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerScene.counter), userInfo: nil, repeats: true)
            pauseTimerBTN.setImage(pauseIMG, for: UIControl.State.normal)
            pauseTimerBTN.setTitle("Pause", for: UIControl.State.normal)
        } else {
            timer.invalidate()
            pauseTimerBTN.setImage(resumeIMG, for: UIControl.State.normal)
            pauseTimerBTN.setTitle("Resume", for: UIControl.State.normal)
            self.view.backgroundColor = .yellow
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let timerInfo = timerInfo else { return }
        preparingLabel.text = "Preparing time is: \(timerInfo["Prepare"] ?? "0")"
        workLabel.text = "Work time is: \(timerInfo["Work"] ?? "0")"
        restLabel.text = "Rest time is: \(timerInfo["Rest"] ?? "0")"
        cycleLabel.text = "Cycles are: \(completedCycles) out of \(timerInfo["Cycle"] ?? "0")"
        setLabel.text = "Sets are: \(completedSets) out of \(timerInfo["Set"] ?? "0")"
        pauseTimerBTN.setImage(pauseIMG, for: UIControl.State.normal)
        pauseTimerBTN.setTitle("Pause", for: UIControl.State.normal)
        prepareTime = Int(timerInfo["Prepare"]!)!
        workTime = Int(timerInfo["Work"]!)!
        restTime = Int(timerInfo["Rest"]!)!
        timerLabel.text = String(prepareTime)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerScene.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter() {
        
        if prepareTime > -1 {
        timerLabel.text = String(prepareTime)
        prepareTime -= 1
        self.view.backgroundColor = .blue
        }
        if prepareTime < 0 && workTime > -1{
            timerLabel.text = String(workTime)
            workTime -= 1
        self.view.backgroundColor = .red
        }
        if workTime < 0 && restTime > -1{
            timerLabel.text = String(restTime)
            restTime -= 1
        self.view.backgroundColor = .green
        }
        if restTime < 0 && completedCycles != Int(timerInfo["Cycle"]!){
            prepareTime = Int(timerInfo["Prepare"]!)!
            workTime = Int(timerInfo["Work"]!)!
            restTime = Int(timerInfo["Rest"]!)!
            completedCycles += 1
            cycleLabel.text = "Cycles are: \(completedCycles) out of \(timerInfo["Cycle"] ?? "0")"
        }
        if restTime < 0 && completedCycles == Int(timerInfo["Cycle"]!) && completedSets != Int(timerInfo["Set"]!) {
            prepareTime = Int(timerInfo["Prepare"]!)!
            workTime = Int(timerInfo["Work"]!)!
            restTime = Int(timerInfo["Rest"]!)!
            completedSets += 1
            completedCycles = 0
            cycleLabel.text = "Cycles are: \(completedCycles) out of \(timerInfo["Cycle"] ?? "0")"
            setLabel.text = "Sets are: \(completedSets) out of \(timerInfo["Set"] ?? "0")"
        }
        if restTime < 0 && completedCycles == Int(timerInfo["Cycle"]!) && completedSets == Int(timerInfo["Set"]!) {
            timer.invalidate()
        }
    }
}
