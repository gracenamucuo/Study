//
//  ViewController.swift
//  Swift_180106_03
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK: - variables
   fileprivate let mainStopwatch:Stopwatch = Stopwatch()
    fileprivate let lapStopwatch:Stopwatch = Stopwatch()
    fileprivate var isPlay:Bool = false
    fileprivate var laps:[String] = []
    
    
    // MARK: - UI components
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lapTimerLabel: UILabel!
    @IBOutlet weak var playPauseButtn: UIButton!
    
    @IBOutlet weak var lapResetButtn: UIButton!
    
    @IBOutlet weak var lapsTableView: UITableView!
    
    //MARK : - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let initCircleButton:(UIButton) -> Void = {button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        initCircleButton(playPauseButtn)
        initCircleButton(lapResetButtn)
        lapResetButtn.isEnabled = false
        lapsTableView.delegate = self
        lapsTableView.dataSource = self
        
    }
    
    //MARK: - UI Settings
    override var shouldAutorotate: Bool
    {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBAction func playPauseAction(_ sender: UIButton) {
        lapResetButtn.isEnabled = true
        changeButton(lapResetButtn, title: "Lap", titleColor: UIColor.black)
        
        if !isPlay {
            unowned let weakSelf = self
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(mainStopwatch.timer, forMode: .commonModes)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
            isPlay = true
            changeButton(playPauseButtn, title: "Stop", titleColor: UIColor.red)
        }else{
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            changeButton(playPauseButtn, title: "Start", titleColor: UIColor.green)
            changeButton(lapResetButtn, title: "Reset", titleColor: UIColor.black)
        }
        
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            changeButton(lapResetButtn, title: "Lap", titleColor: UIColor.lightGray)
            lapResetButtn.isEnabled = false
        }else{
            if let timerLabelText = timerLabel.text{
                laps.append(timerLabelText)
            }
            lapsTableView.reloadData()
            resetLapTimer()
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
        }
    }
    
    //MARK:-Private Helpers
  fileprivate  func changeButton(_ button:UIButton,title:String,titleColor:UIColor) {
     button.setTitle(title, for: UIControlState())
     button.setTitleColor(titleColor, for: UIControlState())
    }

    func resetMainTimer() {
        resetTimer(mainStopwatch, label: timerLabel)
        laps.removeAll()
        lapsTableView.reloadData()
    }
    
    func resetLapTimer() {
        resetTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    func resetTimer(_ stopwatch:Stopwatch,label:UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
    
    
    @objc func updateMainTimer(){
        updateTimer(mainStopwatch, label: timerLabel)
    }
    
    @objc func updateLapTimer(){
        updateTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    
    func updateTimer(_ stopwatch:Stopwatch,label:UILabel) {
        stopwatch.counter = stopwatch.counter + 0.035
        var minuts:String = "\((Int)(stopwatch.counter / 60))"
        if (Int)(stopwatch.counter / 60) < 10 {
            minuts = "0\((Int)(stopwatch.counter / 60))"
        }
        
        var seconds:String = String(format:"%.2f",(stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        label.text = minuts + ":" + seconds
        
    }
    
    //MARK : - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "lapCell"
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap\(laps.count - (indexPath as NSIndexPath).row)"
        }
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
        }
        return cell
    }
    
}

fileprivate extension Selector
{
    static let updateMainTimer = #selector(ViewController.updateMainTimer)
    static let updateLapTimer = #selector(ViewController.updateLapTimer)
}







































































































