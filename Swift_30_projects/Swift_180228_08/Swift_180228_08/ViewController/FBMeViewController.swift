//
//  FBMeViewController.swift
//  Swift_180228_08
//
//  Created by 戴运鹏 on 2018/2/28.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class FBMeViewController: FBMeBaseViewController {

    typealias RowModel = [String:String]
    fileprivate var user:FBMeUser{
        get{
            return FBMeUser.init(name: "BayMax", education: "CMU")
        }
    }
    
    var tableViewDataSource:[[String:Any]] {
        get{
            return TableKeys.populate(withUser: user)
        }
    }
    
    private let tableView:UITableView = {
       let view = UITableView.init(frame: .zero, style: .grouped)
        view.register(FBMeBaseCell.self, forCellReuseIdentifier: FBMeBaseCell.identifier)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Facebook"
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
    }

   fileprivate func rows(at section:Int) -> [Any] {
        return tableViewDataSource[section][TableKeys.Rows] as![Any]
    }
    
    fileprivate func title(at section:Int) -> String? {
        return tableViewDataSource[section][TableKeys.Section]as?String
    }
    
   fileprivate func rowModel(at indexPath:IndexPath) -> RowModel {
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
}

extension FBMeViewController :UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(at: section).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelForRow = rowModel(at: indexPath)
        var cell = UITableViewCell()
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        if title == user.name{
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeBaseCell.identifier, for: indexPath)
        }
        cell.textLabel?.text = title
        
        if let imageName = modelForRow[TableKeys.ImageName] {
            cell.imageView?.image = UIImage.init(named: imageName)
        }else if title != TableKeys.logout{
            cell.imageView?.image = UIImage.init(named: Specs.imageName.placeholder)
        }
        
        if title == user.name{
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        return cell
    }
}

extension FBMeViewController :UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        guard let title = modelForRow[TableKeys.Title] else {
            return 0.0
        }
        if title == user.name {
            return 64
        }else{
            return 44
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        guard let title = modelForRow[TableKeys.Title] else {
            return
        }
        if title == TableKeys.seeMore || title == TableKeys.addFavorites {
            cell.textLabel?.textColor = Specs.color.tint
            cell.accessoryType = .none
        } else if title == TableKeys.logout {
            cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            cell.textLabel?.textColor = Specs.color.red
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .disclosureIndicator
        }    }
}









































