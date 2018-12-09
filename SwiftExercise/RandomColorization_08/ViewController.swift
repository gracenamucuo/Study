//
//  ViewController.swift
//  RandomColorization_08
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    var gardientLayer = CAGradientLayer()
    var timer:Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func musicAction(_ sender: UIButton) {
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let audioError {
            print(audioError)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        gardientLayer.frame = view.bounds
        
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        gardientLayer.colors = [color1,color2,color3,color4,color5]
        gardientLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        gardientLayer.startPoint = CGPoint(x: 0, y: 0)
        gardientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gardientLayer)
        
        
        
        
        
        
    }
    
   @objc func randomColor()  {
    let redValue = CGFloat(drand48())
    let blueValue =  CGFloat(drand48())
    let greenValue = CGFloat(drand48())
    self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}

















