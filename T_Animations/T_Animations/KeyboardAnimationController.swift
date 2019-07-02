//
//  KeyboardAnimationController.swift
//  T_Animations
//
//  Created by dyp on 2019/7/2.
//  Copyright © 2019 dyp. All rights reserved.
//

import UIKit

class KeyboardAnimationController: UIViewController {
    @IBOutlet weak var input: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChangeFrame(_:)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tableView.reloadData()
        view.layoutIfNeeded()

    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            let offset = CGPoint(x: 0, y: self.tableView.contentSize.height - self.tableView.frame.height)
            self.tableView.setContentOffset(offset, animated: false)
        }

    }
    @objc func keyBoardWillChangeFrame(_ noti:Notification)
    {
        let endFrame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let isShow = endFrame.minY - UIScreen.main.bounds.height < 0

        if isShow {
            bottomConstraint.constant = -(UIScreen.main.bounds.height - endFrame.minY - view.safeAreaInsets.bottom)
            UIView.animate(withDuration: noti.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval, animations: {
                self.view.layoutIfNeeded()
                let offset = CGPoint(x: 0, y: self.tableView.contentSize.height - self.tableView.frame.height)
                self.tableView.setContentOffset(offset, animated: false)
            }, completion:{ _ in

            })
        }else{

            bottomConstraint.constant = 0
            UIView.animate(withDuration: noti.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval, animations: {
                self.view.layoutIfNeeded()
                let offset = CGPoint(x: 0, y: self.tableView.contentSize.height - self.tableView.frame.height)
                self.tableView.setContentOffset(offset, animated: false)
            }, completion: { _ in
            })
        }
        
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
}


extension KeyboardAnimationController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension UITableView
{

}
