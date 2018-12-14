//
//  AlbumView.swift
//  BlueLibrarySwift_11
//
//  Created by 戴运鹏 on 2018/12/14.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class AlbumView: UIView {
    private var coverIamgeView: UIImageView!
    private var indicatorView:UIActivityIndicatorView!
    private var valueObservation:NSKeyValueObservation!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        commonInit()
    }
    
    init(frame: CGRect,coverUrl:String) {
        super.init(frame: frame)
        commonInit()
        NotificationCenter.default.post(name: .DYPDownLoadImage, object: self, userInfo: ["imageView":coverIamgeView,"coverUrl":coverUrl])
    }
    
   private func commonInit() {
    backgroundColor = .black
    
    coverIamgeView = UIImageView()
    coverIamgeView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(coverIamgeView)
    
    indicatorView = UIActivityIndicatorView()
    indicatorView.translatesAutoresizingMaskIntoConstraints = false
    indicatorView.style = .whiteLarge
    indicatorView.startAnimating()
    addSubview(indicatorView)
    
    NSLayoutConstraint.activate([
        coverIamgeView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:5),
        coverIamgeView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        coverIamgeView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
        coverIamgeView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    
    valueObservation = coverIamgeView.observe(\.image, options: [.new], changeHandler: { [unowned self] observed, change in
        if change.newValue is UIImage {
            self.indicatorView.stopAnimating()
        }
    })
    
    }
    func highlightAlbum(_ didHighlightView:Bool) {
        if didHighlightView == true {
            backgroundColor = .white
        }else{
            backgroundColor = .black
        }
    }

}

extension Notification.Name
{
    static let DYPDownLoadImage = Notification.Name(downloadImageNotification)
}






























































































































