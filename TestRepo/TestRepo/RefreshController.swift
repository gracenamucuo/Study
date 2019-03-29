//
//  RefreshController.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/9.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit
import PullToRefreshKit
class RefreshController: UIViewController {
    @IBOutlet weak var tableView: CustomTableView!
    var dataCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.tableFooterView = UIView.init()
        configRefresher()
        
        
    }

    deinit {
        print("刷新销毁了")
    }

}
extension RefreshController:UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView.init()
        header.backgroundColor = UIColor.gray
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension RefreshController{
    func configRefresher() {
        tableView.pageCount = NSNumber.init(value: 10)
        
        tableView.et_headerRefreshing {[weak self] in
            self?.dataCount = 10
            let delay = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: delay, execute: {
                self?.tableView.reloadData()
                print("刷新了  刷新了 ")
                self?.tableView.et_endHeaderRefreshing()
                
                self?.loadMore()
            })
        }
        tableView.et_beginRefreshing()
    }
    
    func loadMore() {
        tableView.et_footerRefreshing(5) {[weak self] in
            let delay = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: delay, execute: {
                self?.dataCount += 10
                self?.tableView.reloadData()
                print("刷新了  刷新了 ")
                self?.tableView.et_endRefreshing()
                if let count = self?.dataCount{
                    self?.tableView.et_resetFooterState(count >= 50 ? 9 : count)
                }
            })
        }
    }
    

}







