//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by 戴运鹏 on 2018/12/2.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let musicListViewModel = MusicListViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        musicListViewModel.data.bind(to:tableView.rx.items(cellIdentifier:"CellID")){_,music,cell in
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.singer
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Music.self).subscribe(onNext:{music in
            print("点击选中\(music)")
        }).disposed(by: disposeBag)
    }


}

