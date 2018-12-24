//
//  ViewController.swift
//  RunDemo
//
//  Created by 戴运鹏 on 2018/12/24.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    override var prefersStatusBarHidden: Bool{
        get {
            return true
        }
    }
    var timer = Timer()
    var animationTimer = Timer()
    var month = 0.0
    
    let num = 200.04
    var counter = 0.0
    let dic = ["03":"50.42","04":"61.72","05":"49.14","06":"55.91","07":"63.26","08":"72.85","09":"178.5","10":"205.4","11":"153.9","12":"116.1"]
    var images = ["03","04","05","06","07","08","09","10","11","12"]
    var colors = [UIColor.red,UIColor.green,UIColor.orange,UIColor.green,UIColor.yellow,UIColor.cyan,UIColor.brown,UIColor.purple,UIColor.magenta,UIColor.orange]
    
    var WIDTH:Double{
        return Double(view.frame.width)
    }
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configUI()
    }
    
    func UIColorFromRGB(color_vaule : UInt64 , alpha : CGFloat = 1) -> UIColor {
        let redValue = CGFloat((color_vaule & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((color_vaule & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(color_vaule & 0xFF)/255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }
    

    func configUI() {
        totalLabel.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        totalLabel.center = CGPoint(x: view.center.x, y: view.center.y)
        totalLabel.layer.cornerRadius = 10
        totalLabel.layer.masksToBounds = true
        totalLabel.alpha = 0
        
         borderView.layer.borderWidth = 5
         borderView.layer.borderColor = UIColor.red.cgColor
         borderView.layer.cornerRadius = 5
         borderView.layer.masksToBounds = true
         borderView.frame = CGRect(x: 0, y: 45, width: 90, height: 60)
         borderView.alpha = 0
        
        
    }
    
    func config() {
        guard index <= images.count - 1 else {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollCollectionView), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        config()
    }
    
   @objc func scrollCollectionView() {
    guard index <= images.count - 1 else {
        timer.invalidate()
        return
    }
        collectionView.scrollToItem(at: IndexPath.init(item: index, section: 0), at:.left , animated: true)
        borderViewAnimation()
    }
    
}

//MARK: --
extension ViewController{
    func borderViewAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.borderView.alpha = 1
            self.borderView.frame = CGRect(x: 0, y: 108, width: 90, height: 60)
            
        }) { (fin) in
            
        }
        
        self.perform(#selector(centerLabelAnimation), with: nil, afterDelay: 0)
    }
    
    @objc func centerLabelAnimation(){
        
        UIView.animate(withDuration: 0.3, animations: {
            let key = self.images[self.index]
            self.totalLabel.text = String(format: "%@月\n%@ km",key,self.dic[key]!)
            self.totalLabel.alpha = 1
            self.totalLabel.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        }) { (fin) in
            UIView.animate(withDuration: 0.3, animations: {
                self.totalLabel.transform = CGAffineTransform(scaleX: 0.7,y:0.7)
            }, completion: { (fin) in
                UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.totalLabel.transform = CGAffineTransform.identity
                   
                    let key = self.images[self.index]
                    self.month += Double(self.dic[key]!)!
                    self.bottomLabel.text = String(format: "%.2f km", self.month)
                    self.index += 1
                    if self.month > 1000 {
                        self.height.constant = 120
                        self.bottomView.backgroundColor = self.UIColorFromRGB(color_vaule: 0x50a7ff)
                    }
                    
                    
                }){ (fin) in
                    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                        
                        self.borderView.alpha = 0
                        self.totalLabel.alpha = 0
       
                    }, completion: { (fin) in
                        self.borderView.frame = CGRect(x: 0, y: 45, width: 90, height: 60)
                        guard self.index <= self.images.count - 1 else{
                            return
                        }
                        self.borderView.layer.borderColor = self.colors[self.index].cgColor
                        self.totalLabel.backgroundColor = self.colors[self.index]
                        
          
                    })
                }
            })
        }
    }
    
}

//=========================collectionView=======
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RunImageCell", for: indexPath) as? RunImageCell
        cell?.runImageView.image = UIImage(named: images[indexPath.row])
        return cell!
    }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width, height: view.frame.height)
    }
}

