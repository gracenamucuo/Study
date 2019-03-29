//
//  ETDotsLoadingHeaderRefresher.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/17.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import UIKit
import PullToRefreshKit
class ETDotsLoadingHeaderRefresher: UIView{
    
    let forntDot = UIImageView()
    let middleDot = UIImageView()
    let behindDot = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        forntDot.image = UIImage.init(named: "dot")
        middleDot.image = UIImage.init(named: "dot")
        behindDot.image = UIImage.init(named: "dot")
        backgroundColor = UIColor.white
        
        addSubview(forntDot)
        addSubview(middleDot)
        addSubview(behindDot)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        forntDot.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 5, height: 5))
        middleDot.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 5, height: 5))
        behindDot.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 5, height: 5))
        
        let centerPoint = CGPoint.init(x: frame.size.width / 2, y: frame.size.height / 2)
        
        forntDot.center = CGPoint.init(x: centerPoint.x-15, y: centerPoint.y)
        middleDot.center = centerPoint
        behindDot.center = CGPoint.init(x: centerPoint.x + 15, y: centerPoint.y)
    }
    
    
    func startAnimation() {
        forntDot.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        middleDot.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        behindDot.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options:[.repeat,.autoreverse], animations: {
            self.forntDot.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat,.autoreverse], animations: {
            self.middleDot.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat,.autoreverse], animations: {
            self.behindDot.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func stopAnimation(){
        UIView.animate(withDuration: 0.3, delay: 0.0, options:[], animations: {
            self.forntDot.transform = CGAffineTransform.identity
            self.forntDot.layer.removeAllAnimations()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [], animations: {
            self.middleDot.transform = CGAffineTransform.identity
            self.middleDot.layer.removeAllAnimations()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: [], animations: {
            self.behindDot.transform = CGAffineTransform.identity
            self.behindDot.layer.removeAllAnimations()
        }, completion: nil)

        
    }
    
}

extension ETDotsLoadingHeaderRefresher:RefreshableHeader
{
    func heightForHeader() -> CGFloat {
       return 50
    }
    
    func heightForFireRefreshing() -> CGFloat {
        return 50.0
    }
    
    func heightForRefreshingState() -> CGFloat {
        return 50.0
    }
    
    func didBeginRefreshingState() {
        startAnimation()
    }
    
    
    func didBeginHideAnimation(_ result: RefreshResult) {
        stopAnimation()
    }
    
    func didCompleteHideAnimation(_ result: RefreshResult) {
        stopAnimation()
    }
}
