//
//  EmptyTableController.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/22.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift
class EmptyTableController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.tableFooterView = UIView.init()
        tableView.dataSource = self
        tableView.delegate = self
        let backView = UIView.init()
        backView.backgroundColor = UIColor.blue
        
        tableView.backgroundView = backView
//        tableView.emptyDataSetDelegate = self
//        tableView.emptyDataSetSource = self
        tableView.alwaysBounceVertical = true
        tableView.emptyDataSetView {[weak self] (view) in
            let _ = self?.dataCount
            
            view.titleLabelString(NSAttributedString.init(string: "用扩展设置"))
            view.verticalOffset(-100)
            view.backgroundColor = UIColor.red
            view.isScrollAllowed(true)
            view.didTapDataButton {
                print("-----")
            }
            view.didTapContentView({ () -> (Void) in
                print("点击了内容视图")
            })
            view.buttonTitle(NSAttributedString.init(string: "按钮"), for: .normal)
            view.verticalSpace(100)
        }
        tableView.reloadData()
        
    }
    
    deinit {
        print("空白页面释放")
    }

}



extension EmptyTableController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            dataCount = 0
            tableView.reloadData()
    }
    
}

extension EmptyTableController:EmptyDataSetSource,EmptyDataSetDelegate{
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString.init(string: "暂无数据")
    }
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
//    func emptyDataSetShouldBeForcedToDisplay(_ scrollView: UIScrollView) -> Bool {
//        return true
//    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        dataCount = 10
        tableView.reloadData()
        print("点击了暂无数据")
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        print("点了按钮")
    }
    
    func emptyDataSetWillAppear(_ scrollView: UIScrollView) {
        print("将要出现")
    }
    
    func emptyDataSetDidAppear(_ scrollView: UIScrollView) {
        print("出现了")
    }
    
    func emptyDataSetWillDisappear(_ scrollView: UIScrollView) {
        print("将要消失")
    }
    
    func emptyDataSetDidDisappear(_ scrollView: UIScrollView) {
        print("已经消失")
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return UIColor.gray
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        return nil
    }
}


