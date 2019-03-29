//
//  ETRefreshable.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/17.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import UIKit
public protocol ETRefreshable {
    var scrollView: UIScrollView{get}
    func requestData(success:@escaping (_ count:Int)->Void,fail:@escaping ()->Void)
    func loadMoreData(success:@escaping(_ lastCount:Int)->Void,fail:@escaping ()->Void)
}

public extension ETRefreshable where Self:UIViewController
{
    public func addRefreshHeader(_ pageCount:Int = 10) {
        scrollView.pageCount = NSNumber.init(value: pageCount)
        scrollView.et_headerRefreshing { [weak self] in
            self?.requestData(success: { (count) in
                self?.scrollView.et_endHeaderRefreshing()
                if (self?.scrollView is UITableView || self?.scrollView is UICollectionView){
                    self?.reloadTable()
                    self?.addRefreshFooter(count)
                }
            }, fail: {
                 self?.scrollView.et_endHeaderRefreshing()
            })
        }
    }
    
    func addRefreshFooter(_ lastCount:Int,_ state:ETFooterRefresherState = .noMoreData){
        scrollView.et_footerRefreshing(lastCount) {[weak self] in
            self?.loadMoreData(success: { (lastCount) in
                self?.reloadTable()
                self?.scrollView.et_endFooterRefreshing(state)
            }, fail: {
                self?.scrollView.et_endFooterRefreshing()
            })
        }
    }
    
    func beginRefreshing(){
        scrollView.et_beginRefreshing()
    }
    
    func endAllRefreshing(){
        scrollView.et_endHeaderRefreshing()
        scrollView.et_endFooterRefreshing()
    }
    
    func endHeaderRefreshing() {
        scrollView.et_endHeaderRefreshing()
    }
    
    func endFooterRefreshing(){
        if !(scrollView is UITableView || scrollView is UICollectionView){
            return
        }
        scrollView.et_endFooterRefreshing()
    }
    
    fileprivate func reloadTable() {
        if let scroll = scrollView as? UITableView{
            scroll.reloadData()
        }else if let scroll = scrollView as? UICollectionView{
            scroll.reloadData()
        }
    }
}








