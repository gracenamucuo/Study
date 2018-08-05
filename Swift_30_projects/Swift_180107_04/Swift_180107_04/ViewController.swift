//
//  ViewController.swift
//  Swift_180107_04
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

var todos:[ToDoItem] = []
var test :UIView?
class ViewController: UIViewController {
    
  
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let testView = UIView()
        testView.backgroundColor = UIColor.blue
        testView.frame = CGRect.init(x: 50, y: 100, width: 200, height: 200)
//        view.addSubview(testView)
        test = testView
        if let mode:String = RunLoop.current.currentMode?.rawValue {
            
            if mode == "kCFRunLoopDefaultMode" {
              test!.isHidden = false
            }else{
             test!.isHidden = true
            }
        }
        
        navigationItem.leftBarButtonItem = editButtonItem
        todos = [ToDoItem.init(id: "1", image: "child-selected", title: "Go to Disney", date: dateFromString("2014-10-20")!),
                 ToDoItem.init(id: "2", image: "shopping-cart-selected", title: "CicsoShopping", date: dateFromString("2014-10-28")!),
                 ToDoItem.init(id: "3", image: "phone-selected", title: "Phone to Jobs", date: dateFromString("2014-12-20")!),
                 ToDoItem.init(id: "4", image: "travel-selected", title: "paln To play", date: dateFromString("2014-10-25")!)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("\(String(describing: RunLoop.current.currentMode))")
    }

    //MARK: - helper func

    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editToDo" {
            let vc = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let indexPath = indexPath{
                vc.todo = todos[(indexPath as NSIndexPath).row]
            }
            
            
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    

    

}

extension UIViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todos.count != 0 {
            return todos.count
        }else{
            let messageLabel :UILabel = UILabel()
            setMessageLabel(messageLabel, frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), text: "No data is currently available.", textColor: UIColor.black, numberLines: 0, textAliment: NSTextAlignment.center, font: UIFont(name:"Palatino-Italic", size: 20)!)
        
            tableView.backgroundView = messageLabel
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "todoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
       setCellWithTodoItem(cell, todo: todos[(indexPath as NSIndexPath).row])
        return cell
    }
}

extension UIViewController: UITableViewDelegate{
 
    // Edit mode
    
//    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        //        print("\(String(describing: RunLoop.current.currentMode))")
//        if let mode:String = RunLoop.current.currentMode?.rawValue {
//            
//            if mode == "kCFRunLoopDefaultMode" {
//                test?.isHidden = false
//            }else{
//                test?.isHidden = true
//            }
//        }
//    }
    
//    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//
//        if let mode:String = RunLoop.current.currentMode?.rawValue {
//
//            if mode == "kCFRunLoopDefaultMode" {
//                test?.isHidden = false
//            }else{
//                test?.isHidden = true
//            }
//        }
//    }
//
//    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let time: TimeInterval = 0.001
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
//            if let mode:String = RunLoop.current.currentMode?.rawValue {
//
//                if mode == "kCFRunLoopDefaultMode" {
//                    test?.isHidden = false
//                }else{
//                    test?.isHidden = true
//                }
//            }
//        }
//
//    }

    // Delete the cell
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // Move the cell
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: (sourceIndexPath as NSIndexPath).row)
        todos.insert(todo, at: (destinationIndexPath as NSIndexPath).row)
    }
}

func setMessageLabel(_ messageLabel:UILabel,frame:CGRect,text:String,textColor:UIColor,numberLines:Int,textAliment:NSTextAlignment,font:UIFont) {
    messageLabel.frame = frame
    messageLabel.text = text
    messageLabel.textColor = textColor
    messageLabel.numberOfLines = numberLines
    messageLabel.textAlignment = textAliment
    messageLabel.font = font
    messageLabel.sizeToFit()
}
 func setCellWithTodoItem(_ cell:UITableViewCell,todo:ToDoItem) {
    let imageView:UIImageView = cell.viewWithTag(11) as!UIImageView
    let titleLabel:UILabel = cell.viewWithTag(12) as! UILabel
    let dateLabel:UILabel = cell.viewWithTag(13) as! UILabel
    imageView.image = UIImage.init(named: todo.image)
    titleLabel.text = todo.title
    dateLabel.text = stringFromDate(todo.date)
}













































































































