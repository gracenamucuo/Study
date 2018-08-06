//
//  ViewController.swift
//  Swift_180106_02
//
//  Created by 戴运鹏 on 2018/1/6.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tweet:Tweet?
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var straightSwitch: UISwitch!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var workTF: UITextField!
    
    @IBOutlet weak var genderSeg: UISegmentedControl!
    
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDayPicker.maximumDate = Date()
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self.view, action: Selector.endEditing))
        nameTF.delegate = self
        workTF.delegate = self
    }

    
    @IBAction func sliderChange(_ sender: UISlider) {
         salaryLabel.text = "$\((Int)(sender.value))k"
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        
        func getLabelsInfo() ->(name:String?,work:String?,salary:String?){
            guard let name = nameTF.text,
                let work = workTF.text,
                let salary = salaryLabel.text
            else {
                return (nil,nil,nil)
            }
            if name.isEmpty || work.isEmpty || salary.isEmpty {
                return(nil,nil,nil)
            }
            return(name,work,salary)
        
        }
        
        func geteAge() -> Int?{
            let ageComponents = Calendar.current.dateComponents([.year], from: birthDayPicker.date,to:Date())
            return ageComponents.year
        }
        
        let labelInfo = getLabelsInfo()
        if let name  = labelInfo.name,let work = labelInfo.work ,let salary = labelInfo.salary,let age = geteAge() {
               tweet = Tweet(gender: Gender(rawValue: genderSeg.selectedSegmentIndex)!, name: name, age: age, work: work, salary: salary, isStraight: straightSwitch.isOn)
        }else{
            tweet = nil
        }
        
        switch tweet {
        case .some(let tweet):
            showAlert(title: "Love Tweet", msg: tweet.info, bottonTitle: "OK")
        case .none:
            showAlert(title: "Info miss or invalid", msg: "Please fill out correct personal info", bottonTitle: "OK")
            
        }
    }
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController : UITextFieldDelegate
{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}






























