//
//  UITableView+ETRefresh.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/14.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit
import Foundation
import ObjectiveC
import PullToRefreshKit
private var pageCountKey:UInt = 0

public enum ETRefreshResult:Int {
    case success = 200
    case failure = 400
    case none = 0
}

public enum ETHeaderRefresherState {
    case refreshing
    case normal(ETRefreshResult,TimeInterval)
    case removed
}

/// 下拉加载更多的状态
///
/// - refreshing: 开始刷新
/// - normal: 结束刷新的正常状态
/// - noMoreData: 结束刷新显示没有更多数据
/// - removed: 移除
public enum ETFooterRefresherState {
    case refreshing
    case normal
    case noMoreData
    case removed
}

public extension UIScrollView
{
    var pageCount:NSNumber? {
        get{
            return objc_getAssociatedObject(self, &pageCountKey) as? NSNumber
        }
        
        set{
            objc_setAssociatedObject(self, &pageCountKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func et_headerRefreshing(_ action:@escaping ()->Void) {
        //container参数是用来销毁刷新控件 不对外提供 都默认传tableView的父控件。
        configRefreshHeader(container: superview ?? UIView()) {
            action()
        }
    }
    
    func et_beginRefreshing(){
        switchRefreshHeader(to: .refreshing)
    }
    
    func et_footerRefreshing(_ lastCount:Int, _ action:@escaping ()->Void) {
        
        if !(self is UITableView || self is UICollectionView){
            return
        }
    
        configRefreshFooter(container: superview ?? UIView.init()) {
                action()
        }
        et_resetFooterState(lastCount)
    }
    //对footer控件根据最新上拉请求的数量更新状态
    func et_resetFooterState(_ lastCount:Int) {
        let endState = (lastCount >= self.pageCount?.intValue ?? 10) ? FooterRefresherState.normal : FooterRefresherState.noMoreData
        switchRefreshFooter(to: endState)
    }
    
    func et_endRefreshing(_ headerEndState:ETHeaderRefresherState = ETHeaderRefresherState.normal(.none, 0),_ footerEndState:ETFooterRefresherState = ETFooterRefresherState.normal) {
        et_endHeaderRefreshing(headerEndState)
        et_endFooterRefreshing(footerEndState)
    }
    
    func et_endFooterRefreshing(byCount lastCount:Int) {
        et_resetFooterState(lastCount)
    }
    
    //以下两个api为切换刷新控件的状态
    func et_endHeaderRefreshing(_ state:ETHeaderRefresherState = ETHeaderRefresherState.normal(.none, 0)) {
        var endState = HeaderRefresherState.normal(.none, 0)
        switch state {
        case let .normal( result, delay):
            endState = HeaderRefresherState.normal(RefreshResult(rawValue: result.rawValue) ?? RefreshResult.none,delay)
        case .refreshing:
            endState = HeaderRefresherState.refreshing
        case .removed:
            endState = HeaderRefresherState.removed
        }
        switchRefreshHeader(to: endState)
    }

    func et_endFooterRefreshing(_ state:ETFooterRefresherState = ETFooterRefresherState.normal) {
        var endState = FooterRefresherState.normal
        switch state {
        case .normal:
            endState = FooterRefresherState.normal
        case .noMoreData:
            endState = FooterRefresherState.noMoreData
        case .refreshing:
            endState = FooterRefresherState.refreshing
        case .removed:
            endState = FooterRefresherState.removed
        }
        switchRefreshFooter(to: endState)
    }
    

}
