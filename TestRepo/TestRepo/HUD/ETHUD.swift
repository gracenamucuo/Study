//
//  ETHUD.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2019/1/2.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import PKHUD

enum ETHUDCustomViewType {
    case image(imageName:String)
    case message(msg:String)
    case systemActivity
    case loading
    case logo
}

struct ETHUD {
  static let delayTime:TimeInterval = 1
    
    static func showLoading(onView view:UIView? = nil){
        defaultHUDSetting()
        let customView = customContentView(.loading)
        HUD.show(.customView(view: customView), onView: view)
    }
    
   static func showSystemLoading(onView view:UIView? = nil) {
        defaultHUDSetting()
        let customView = customContentView(.systemActivity)
        HUD.show(.customView(view: customView), onView: view)
    }
    
    static func showLogoLoading(onView view:UIView? = nil) {
        defaultHUDSetting()
        let customView = customContentView(.logo)
        HUD.show(.customView(view: customView), onView: view)
    }
    
    static func hideHud(delay afterDelay:TimeInterval? = 0 ,completion:((Bool) -> Void)? = nil) {
        HUD.hide(afterDelay: afterDelay!, completion:completion)
    }
    
 ///================================自动隐藏============================================
    /// 暂无权限弹框
    static func showPermissionLimit(onView view:UIView? = nil,completion:((Bool) -> Void)? = nil) {
        let customView = customContentView(.image(imageName: "permissionNoRights"))
        defaultHUDSetting()
        HUD.flash(.customView(view: customView), onView: view, delay: delayTime, completion:completion)
    }
    
   static func showText(_ text:String,onView view:UIView? = nil,completion:((Bool) -> Void)? = nil){
        defaultHUDSetting()
        let labelView = customContentView(.message(msg: text))
        HUD.flash(.customView(view: labelView), onView: view, delay: delayTime, completion:completion)
    }
    
   static func showImageHud(_ imageName:String,onView view:UIView? = nil,completion:((Bool) -> Void)? = nil) {
        let customView = customContentView(.image(imageName: imageName))
        defaultHUDSetting()
        HUD.flash(.customView(view: customView), onView: view, delay: delayTime, completion:completion)
    }
    
    
    static func customContentView(_ customType:ETHUDCustomViewType) -> UIView {
        switch customType {
        case let .image(imageName):
            return ETHUDImageView.init(imageName: imageName)
        case let .message(msg):
            return ETHUDTextView.init(msg:msg)
        case .systemActivity:
            return ETHUDSystemActivityView.init(frame:CGRect(origin: CGPoint.zero, size: CGSize(width: 80, height: 80)))
        case .loading:
            return ETHUDLoadingView.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 156, height:  156)))
        case .logo:
            return ETHUDLogoView.init(frame: CGRect(origin:CGPoint.zero, size: CGSize(width: 130, height: 50)))
        }
    }
    
}


extension ETHUD
{
    static func defaultHUDSetting(){
        HUD.allowsInteraction = false
        HUD.dimsBackground = false
    }
    
    static func dimsHUDSetting(){
        HUD.dimsBackground = true
    }
    
    static func interationHUDSetting() {
        HUD.allowsInteraction = true
    }
    
    
}



//MARK: ---自定义视图

/// 自定义弹出的图片view
class ETHUDImageView: UIView {
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(image:UIImage) {
        let imageFrame = CGRect(origin: CGPoint.zero, size: image.size)
        super.init(frame:imageFrame)
        imageView.image = image
        imageView.frame = imageFrame
        addSubview(imageView)
    }
    convenience init(imageName:String) {
        self.init(image: UIImage.init(named: imageName) ?? UIImage())
    }

}

///自定义弹出的文字的view
class ETHUDTextView: UIView {
    let msgLabel:UILabel = {
       let msgLabel = UILabel()
        msgLabel.numberOfLines = 0
        msgLabel.textColor = UIColor.white
        msgLabel.textAlignment = .center
        msgLabel.font = UIFont.init(name: "HelveticaNeue", size: 16)
        return msgLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(msg:String) {
        let width = UIScreen.main.bounds.size.width / 3 * 2
        let edge = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        
        msgLabel.text = msg
        let size = msgLabel.sizeThatFits(CGSize(width: width, height: 500))
        let labelFrame = CGRect(origin: CGPoint(x: edge.top, y: edge.left), size: CGSize.init(width: min(width, size.width) + 10, height: size.height + 10))
        super.init(frame:labelFrame.insetBy(dx: -edge.left, dy: -edge.top))
        backgroundColor = UIColor.black.withAlphaComponent(0.85)
        
        msgLabel.frame = labelFrame
        addSubview(msgLabel)
    }
    
}

///自定义系统activityView
class ETHUDSystemActivityView: UIView {
    let activity:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView.init()
        activity.style = .whiteLarge
        return activity
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activity.center = center
        activity.startAnimating()
        backgroundColor = UIColor.black.withAlphaComponent(0.75)
        addSubview(activity)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

class ETHUDLogoView: UIView {
    let logo:UIImageView = {
       let logo = UIImageView.init(image: UIImage.init(named: "loading"))
       logo.contentMode = .left
        return logo
    }()
    var overlay = UIView()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        logo.frame = CGRect(origin:CGPoint.zero, size: UIImage.init(named: "loading")?.size ?? CGSize(width: 110, height: 20))
        logo.center = center
        overlay.frame = logo.frame
        addSubview(logo)
        addSubview(overlay)
        
        layer.cornerRadius = 5
        clipsToBounds = true
        overlay.layer.add(ETHUDAnimation.loading, forKey: nil)
        backgroundColor = UIColor.lightGray
        overlay.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

///loadingView

class ETHUDLoadingView: UIView {
    let loadingView = PKHUDProgressView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadingView.bounds = bounds
        loadingView.center = center
        
        loadingView.startAnimation()
        addSubview(loadingView)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
