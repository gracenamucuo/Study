//
//  HorizontalScroller.swift
//  BlueLibrarySwift_11
//
//  Created by 戴运鹏 on 2018/12/14.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
//MARK: -DataSource

protocol HorizontalScrollerDataSource:class{
    func numberOfViews(in horizontalScrollerView:HorizontalScrollerView) -> Int
    
    func horizontalScrollerView(_ horizontalScrollerView:HorizontalScrollerView,viewAt index:Int) -> UIView
    
}

extension HorizontalScrollerDataSource{
    func initialViewIndex(_ scroller:HorizontalScrollerView) -> Int {
        return 0
    }
}

//MARK: -Delegate
protocol HorizontalScrollerDelegate:class {
    func horizontalScrollerView(_ horizontalScrollView:HorizontalScrollerView,didSelectViewAt index:Int)
}


class HorizontalScrollerView: UIView {
   weak var delegate:HorizontalScrollerDelegate?
   weak var dataSource:HorizontalScrollerDataSource?
    
   fileprivate enum ViewConstants {
   static let Padding:CGFloat = 10
   static let Dimensions:CGFloat = 100
   static let offSet:CGFloat = 100
    }
    
   fileprivate var scoller = UIScrollView()
   fileprivate var contentViews = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initializeScrollView()
    }
    
    func initializeScrollView() {
        addSubview(scoller)
        
        scoller.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoller.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scoller.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scoller.topAnchor.constraint(equalTo: self.topAnchor),
            scoller.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        let tapGr = UITapGestureRecognizer(target: self, action: Selector.scrollerDidTap)
        scoller.addGestureRecognizer(tapGr)
        
    }
    
    override func didMoveToSuperview() {
        reload()
    }
    
    func scrollToView(at index:Int,animated:Bool = true) {
        guard index < contentViews.count else {
            return
        }
        let centralView = contentViews[index]
        let targetCenter = centralView.center
        let targetOffsetX = targetCenter.x - (scoller.bounds.width / 2)
        scoller.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: animated)
    }
    
   @objc func scrollerDidTap(_ gesture:UITapGestureRecognizer) {
    let location = gesture.location(in: gesture.view)
    guard let index = contentViews.index(where:{$0.frame.contains(location)}) else {
        return
    }
    delegate?.horizontalScrollerView(self, didSelectViewAt: index)
    scrollToView(at: index)
    }
    
    func viewAtIndex(_ index:Int) -> UIView {
        return contentViews[index]
    }
    
    func reload() {
        guard let dataSource = dataSource else {
            return
        }
        contentViews.forEach {$0.removeFromSuperview()}
        var xValue = ViewConstants.offSet
        contentViews = (0..<dataSource.numberOfViews(in: self)).map({ index in
            xValue += ViewConstants.Padding
            let view = dataSource.horizontalScrollerView(self, viewAt: index)
            view.frame = CGRect(x: CGFloat(xValue), y: ViewConstants.Padding, width: ViewConstants.Dimensions, height: ViewConstants.Dimensions)
            scoller.addSubview(view)
            xValue += ViewConstants.Dimensions + ViewConstants.Padding
            return view
        })
        
        scoller.contentSize = CGSize(width: CGFloat(xValue + ViewConstants.offSet), height: frame.size.height)
        
    }
    
    func centerCurrentView() {
        
        let centerRect = CGRect(origin: CGPoint(x: scoller.bounds.midX - ViewConstants.Padding, y:0), size: CGSize(width: ViewConstants.Padding, height: bounds.height))
        guard let selectedIndex = contentViews.index(where:{$0.frame.intersects(centerRect)}) else {
            return
        }
        let centralView = contentViews[selectedIndex]
        let targetCenter = centralView.center
        let targetOffsetX = targetCenter.x - (scoller.bounds.width/2)
        scoller.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: true)
        delegate?.horizontalScrollerView(self, didSelectViewAt: selectedIndex)
        
    }
    
}

extension HorizontalScrollerView:UIScrollViewDelegate
{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            centerCurrentView()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        centerCurrentView()
    }
    
}

fileprivate extension Selector
{
    static let scrollerDidTap = #selector(HorizontalScrollerView.scrollerDidTap(_:))
}





































