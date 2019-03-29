//
//  FrameController.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/17.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit
import PullToRefreshKit
class FrameController: UIViewController {

    var tableView = CustomTableView.init(frame: CGRect.zero, style: .plain)
    var dataCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .automatic
        } else {
            // Fallback on earlier versions
        }
        layoutUI()
        configTable()
        addRefreshHeader()
        
    }
    deinit {
        print("协议控制器销毁")
    }
    

}

extension FrameController {
    func layoutUI() {
        if #available(iOS 11.0, *) {
            tableView.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 64), size: CGSize.init(width: view.frame.width, height: view.frame.height - 64))
        } else {
            tableView.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: view.frame.width, height: view.frame.height - 64))
        }
        view.addSubview(tableView)
        let header = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: view.frame.width, height: 100)))
        header.backgroundColor = UIColor.green
        tableView.tableHeaderView = header
        tableView.tableFooterView = UIView.init()
    }
    
    func configTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension FrameController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.switchRefreshHeader(to: .refreshing)
    }
}

extension FrameController: ETRefreshable {
    var scrollView: UIScrollView {
        return tableView
    }
    
//    func requestData(success: @escaping (Int) -> Void) {
//        let delay = DispatchTime.now() + 2
//        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
//            print("请求成功了")
//            self.dataCount = 10
//            self.tableView.reloadData()
//
//            success(10)
//        })
//    }

    func requestData(success: @escaping (Int) -> Void, fail: @escaping () -> Void) {
        let delay = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
            print("请求成功了")
            self.dataCount = 10
            self.tableView.reloadData()
            
            success(10)
            fail()
        })
    }

    func loadMoreData(success: @escaping (Int) -> Void, fail:@escaping () -> Void) {
        let delay = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
            self.dataCount += 10
            self.tableView.reloadData()
            print("加载更多了")
            let last = self.dataCount >= 100 ? 9 : 10
            success(last)
            fail()
        })
    }
}
