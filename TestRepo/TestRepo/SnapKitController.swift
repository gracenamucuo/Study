//
//  SnapKitController.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/16.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit
import SnapKit
import PullToRefreshKit
class SnapKitController: UIViewController {
    var tableView:UITableView = UITableView.init(frame: CGRect.zero, style: .plain)
    var dataCount = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        
        layoutUI()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0) {
//            self.setRefresher()
//            self.tableView.switchRefreshHeader(to:.refreshing)
        }
    }
    

}

extension SnapKitController{
    func layoutUI() {
        view.addSubview(tableView)
        let header = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size:CGSize.init(width: view.frame.width, height: 100)))
        header.backgroundColor = UIColor.green
        tableView.tableHeaderView = header
        tableView.backgroundColor = UIColor.red
        tableView.snp.makeConstraints { (make) in
            
            make.left.bottom.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalToSuperview()
            }
        }
    }
    
//    func setRefresher() {
//        self.tableView.configRefreshHeader(container: self) {[weak self] in
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//                self?.dataCount = 10
//                self?.tableView.reloadData()
//                self?.tableView.switchRefreshHeader(to: .normal(.success, 1))
//                print("刷新了")
//            })
//        }
//
//        self.tableView.configRefreshFooter(container: self) {[weak self] in
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//                self?.dataCount += 10
//                self?.tableView.reloadData()
//                var state = FooterRefresherState.normal
//                if self?.dataCount ?? 10 > 50 {
//                    state = FooterRefresherState.normal
//                }
//                self?.tableView.switchRefreshFooter(to:state)
//                print("更多了")
//            })
//        }
//    }

}

extension SnapKitController:UITableViewDataSource,UITableViewDelegate{
    
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: view.frame.width, height: 30)))
        sectionHeader.backgroundColor = UIColor.gray
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

