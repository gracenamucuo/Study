//
//  ViewController.swift
//  SwiftExercise
//
//  Created by 戴运鹏 on 2018/11/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let colorRatio:CGFloat = 10
    lazy var dataArray:Array<Any> = {
        return ["第一行","第二行","第三行","第四","第五","第六"]
    }()
    var actionController:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionController = UIAlertController(title: "我是标题", message: "我是信息", preferredStyle: .alert)
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: "cellID")
        self.tableView.rowHeight = 100
        self.tableView.tableFooterView = UIView()
        
        self.testParaserJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        let cells = tableView.visibleCells
        for (index,cell) in cells.enumerated() {
            cell.frame.origin.y = 100
            
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as?CustomCell
        cell?.title?.text = self.dataArray[indexPath.row]as? String
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:100))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 100)
        let lowerColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, green: 1.0, blue:(CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, alpha: 1).cgColor
      
        let upperColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, green: 1.0, blue:(CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor
        gradientLayer.colors = [lowerColor,upperColor]
       bgView.layer.addSublayer(gradientLayer)
        cell?.contentView.addSubview(bgView)
        cell?.contentView.sendSubviewToBack(bgView)
        
        
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("选择了\(indexPath.row)行")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal, title: "👍") { (action, index) in
            self.actionController.message = "谢谢赞了"
            self.showAlert()
        }
        
        let dislikeAction = UITableViewRowAction(style: .default, title: "👎") { (action, index) in
            self.actionController.message = "为什么 为什么"
            self.showAlert()
        }
        
        let otherAction = UITableViewRowAction.init(style: .destructive, title: "🤔") { (action, index) in
            self.actionController.message = "其它+\(index)"
            self.showAlert()
        }
        
        
        return [likeAction,dislikeAction,otherAction]
        
    }
    func showAlert() {
        self.present(self.actionController, animated: true) {
            let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
                self.actionController.dismiss(animated:true, completion: nil)
            })
            RunLoop.main.add(dismissTimer, forMode:.common)
            
        }
    }
    
    func testParaserJson() {
        let path = Bundle.main.path(forResource: "testjson", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonArr = jsonData as! Array<Any>
            for anyObj in jsonArr.enumerated()
            {
                print(String(describing: anyObj))
            }
//            let decoder = JSONDecoder()
//
//            let beer = try!decoder.decode(Beer.self, from: data)
//                print("\(beer.name)")
//            print(String(describing: beer))
        }catch let error as Error?{
            print("出现错误\(String(describing: error))")
        }

    }
    
}

