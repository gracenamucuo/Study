//
//  DetailViewController.swift
//  Animations_12
//
//  Created by 戴运鹏 on 2018/12/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
//  fileprivate let items = ["2-Color","Simple 2D Rotation","Multicolor","Multi Point Position","BezierCurve Position","Color and Frame Change","View Fade In","Pop"]
class DetailViewController: UIViewController {
    //MARK: - Variables
    var barTitle = ""
    var animateView:UIView!
    fileprivate let duration = 2.0
    fileprivate let delay = 0.2
    fileprivate let scale = 1.2

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRect()
        setupNavigationBar()
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = barTitle
    }
    
    func setupRect() {
        if barTitle == "BezierCurve Position" {
            animateView = drawCircleView()
        }else if barTitle == "View Fade In"{
            animateView = UIImageView(image: UIImage(named: "whatsapp"))
            animateView.frame = generalFrame
            animateView.center = generalCenter
        }else{
            animateView = drawRectView(UIColor.red, frame: generalFrame, center: generalCenter)
        }
        view.addSubview(animateView)
    }
    
    @IBAction func animateAction(_ sender: UIButton) {
        switch barTitle {
        case "2-Color":
            changeColor(UIColor.green)
            
        case "Simple 2D Rotation":
            rotateView(Double.pi)
            
        case "Multicolor":
            multiColor(UIColor.green, UIColor.blue)
            
        case "Multi Point Position":
            multiPosition(CGPoint(x: animateView.frame.origin.x, y: 100), CGPoint(x: animateView.frame.origin.x, y: 350))
            
        case "BezierCurve Position":
            var controlPoint1 = self.animateView.center
            controlPoint1.y -= 125.0
            var controlPoint2 = controlPoint1
            controlPoint2.x += 40.0
            controlPoint2.y -= 125.0
            
            var endPoint = self.animateView.center
            endPoint.x += 75.0
            curvePath(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
            
            
        case "Color and Frame Change":
            let currentFrame = self.animateView.frame
            let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
            let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
            let thirdFrame = secondFrame.insetBy(dx: -15, dy: -20)
            colorFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
            
            
        case "View Fade In":
            viewFadeIn()
        case "Pop":
            Pop()
        default:
            let alert = makeAlert("Alert", message: "The animation not implemented yet", actionTitle: "OK")
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func changeColor(_ color:UIColor) {
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.backgroundColor = color
        }, completion: nil)
    }
    
    func multiColor(_ firstColor:UIColor,_ secondColor:UIColor)  {
        UIView.animate(withDuration: duration, animations: {
            self.animateView.backgroundColor = firstColor
        }) { (finished) in
            self.changeColor(secondColor)
        }
    }
    
    func multiPosition(_ firstPos:CGPoint,_ secondPos:CGPoint) {
        func simplePosition(_ pos:CGPoint){
            UIView.animate(withDuration: self.duration, animations: {
                self.animateView.frame.origin = pos
            }, completion: nil)
        }
        
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.frame.origin  = firstPos
        }) { (finished) in
            simplePosition(secondPos)
        }
    }
    
    func rotateView(_ angel:Double)  {
        UIView.animate(withDuration: duration, delay: delay, options: [.repeat], animations: {
            self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
        }, completion: nil)
    }
    
    func colorFrameChange(_ firstFrame:CGRect,_ secondFrame:CGRect,_ thirdFrame:CGRect,_ firstColor:UIColor,_ secondColor:UIColor,_ thirdColor:UIColor)  {
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.backgroundColor = firstColor
            self.animateView.frame = firstFrame
        }) { (finished) in
            UIView.animate(withDuration: self.duration, animations: {
                self.animateView.backgroundColor = secondColor
                self.animateView.frame = secondFrame
            }, completion: { (finished) in
                UIView.animate(withDuration: self.duration, animations: {
                    self.animateView.backgroundColor = thirdColor
                    self.animateView.frame = thirdFrame
                }, completion: nil)
            })
        }
    }
    
    fileprivate func curvePath(_ endPoint:CGPoint,controlPoint1:CGPoint,controlPoint2:CGPoint){
        let path = UIBezierPath()
        path.move(to: animateView.center)
        
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.cgPath
        
        anim.duration = self.duration
        
        animateView.layer.add(anim, forKey: "animate position along path")
        animateView.center = endPoint
        
    }
    
    
   fileprivate func viewFadeIn() {
        let secondView = UIImageView(image: UIImage(named: "facebook"))
        secondView.frame = animateView.frame
        secondView.alpha = 0.0
        
        view.insertSubview(secondView, aboveSubview: animateView)
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            secondView.alpha = 1.0
           self.animateView.alpha = 0.0
        }, completion: nil)
        
    }
    
   fileprivate func Pop() {
    
    UIView.animate(withDuration: duration / 4, animations: {
        self.animateView.transform = CGAffineTransform(scaleX: CGFloat(self.scale), y: CGFloat(self.scale))
    }) { (finished) in
        UIView.animate(withDuration: self.duration/4, animations: {
            self.animateView.transform = CGAffineTransform.identity
        })
    }
    
    
    }
}















