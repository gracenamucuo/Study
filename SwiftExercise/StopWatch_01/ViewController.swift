//
//  ViewController.swift
//  StopWatch_01
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
    }


}

//MARK:-----Actions
extension ViewController
{
    @IBAction func startAction(_ sender: UIButton) {
        if isPlaying {
            return
        }
        
        startBtn.isEnabled = false
        stopBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nibName, repeats: true)
        isPlaying = true
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        startBtn.isEnabled = true
        stopBtn.isEnabled = true
    }
    
    @objc func updateTimer()  {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
}

//TODO:---

//FIXME:--
