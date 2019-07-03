//
//  ViewController.swift
//  T_Animations
//
//  Created by dyp on 2019/7/2.
//  Copyright © 2019 dyp. All rights reserved.
//

import UIKit

class AutoLayoutAnimationsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    
    
    var slider:HorizontalItemList!
    var isMenuOPen = false
    var items:[Int] = [5,6,7]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        self.tableView.rowHeight = 54.0
        
    }

    @IBAction func addAction(_ sender: UIButton) {
        isMenuOPen = !isMenuOPen
        titleLabel.superview?.constraints.forEach{ constraint in
            if constraint.firstItem === titleLabel && constraint.firstAttribute == .centerX {
                constraint.constant = isMenuOPen ? -100.0 : 0.0
                return
            }
            
            if constraint.identifier == "TitleCenterY"{
                constraint.isActive = false
                let newConstraint = NSLayoutConstraint(
                    item: titleLabel!,
                    attribute: .centerY,
                    relatedBy: .equal,
                    toItem: titleLabel.superview!,
                    attribute: .centerY,
                    multiplier: isMenuOPen ? 0.67 : 1.0,
                    constant: 0)
                newConstraint.identifier = "TitleCenterY"
                newConstraint.isActive = true
                return
            }
        }
            menuHeightConstraint.constant = isMenuOPen ? 184.0 : 44.0
            titleLabel.text = isMenuOPen ? "Select Item" : "Packing List"
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                let angle:CGFloat = self.isMenuOPen ? .pi / 4 : 0.0
                self.buttonMenu.transform = CGAffineTransform(rotationAngle: angle)
                
            }, completion: nil
            )
            
            if isMenuOPen{
                slider = HorizontalItemList(inView: view)
                slider.didSelectItem = { index in
                    self.items.append(index)
                    self.tableView.reloadData()
                    self.addAction(self.buttonMenu)
                }
                self.titleLabel.superview!.addSubview(slider)
            }else{
                slider.removeFromSuperview()
            }
            
        }
    
    
    func showItem(_ index:Int) {
        let imageView = UIImageView(image:UIImage(named: "summericons_100px_0\(index).png"))
        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        imageView.layer.cornerRadius = 5.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let conX = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let conBottom = imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: imageView.frame.height)
        
        let conWidth = imageView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.33,constant: -50.0)
        let conHeight = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        NSLayoutConstraint.activate([conX,conBottom,conWidth,conHeight])
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
            conBottom.constant = -imageView.frame.size.height / 2
            conWidth.constant = 0.0
            self.view.layoutIfNeeded()

            print("\(imageView.frame)")

        }, completion: nil)

        UIView.animate(withDuration: 0.8, delay: 1.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
            conBottom.constant = imageView.frame.size.height
            conHeight.constant = -50
            self.view.layoutIfNeeded()
            print("\(imageView.frame.size)")
        }) { _ in
            imageView.removeFromSuperview()
        }
        
        
        
        
        
        
    }
    
    
}


let itemTitles =  ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]


extension AutoLayoutAnimationsController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.accessoryType = .none
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showItem(items[indexPath.row])        
    }
    
}
