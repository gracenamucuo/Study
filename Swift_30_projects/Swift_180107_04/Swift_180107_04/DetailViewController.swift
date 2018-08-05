//
//  DetailViewController.swift
//  Swift_180107_04
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var todo:ToDoItem?
    
    
    //MARK: - variables
    
    @IBOutlet weak var childButtn: UIButton!
    
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var shoppingCartButton: UIButton!
    
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var todoTF: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            self.title = "Edit Todo"
            if todo.image == "child-selected"{
                childButtn.isSelected = true
            }else if todo.image == "phone-selected"{
                phoneButton.isSelected = true
            }else if todo.image == "shopping-cart-selected"{
                shoppingCartButton.isSelected = true
            }else if todo.image == "travel-selected"{
                travelButton.isSelected = true
            }
            todoTF.text = todo.title
            datePicker.setDate(todo.date, animated: false)
            
        }else{
            self.title = "Add Todo"
            childButtn.isSelected = true
        }
    }

    @IBAction func selectChild(_ sender: UIButton) {
        resetButtons()
        childButtn.isSelected = true
    }
    
    @IBAction func selectPhone(_ sender: UIButton) {
        resetButtons()
        phoneButton.isSelected = true
    }
    
    @IBAction func selectShopping(_ sender: UIButton) {
        resetButtons()
        shoppingCartButton.isSelected = true
    }
    
    @IBAction func selectTravel(_ sender: UIButton) {
        resetButtons()
        travelButton.isSelected = true
    }
    
    func resetButtons() {
        childButtn.isSelected = false
        phoneButton.isSelected = false
        shoppingCartButton.isSelected = false
        travelButton.isSelected = false
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        var image = ""
        if childButtn.isSelected {
            image = "child-selected"
        }else if phoneButton.isSelected{
            image = "phone-selected"
        }else if shoppingCartButton.isSelected{
            image = "shopping-cart-selected"
        }else if travelButton.isSelected{
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = todoTF.text!
            todo.date = datePicker.date
        }else{
            let uuid = UUID().uuidString
            todo = ToDoItem.init(id: uuid, image: image, title: todoTF.text!, date: datePicker.date)
            todos.append(todo!)
        }
        let _ = navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}





































































