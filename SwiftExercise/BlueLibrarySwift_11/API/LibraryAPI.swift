//
//  LibraryAPI.swift
//  BlueLibrarySwift_11
//
//  Created by 戴运鹏 on 2018/12/14.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    //MARK:-单例
    static let sharedInstance = LibraryAPI()
    
   fileprivate let persistencyManager:PersistencyManager
   fileprivate let httpClient:HTTPClient
   fileprivate let isOnline:Bool
    
    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false
        super.init()
        NotificationCenter.default.addObserver(self, selector: .downloadImage, name:NSNotification.Name(rawValue: downloadImageNotification), object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func getAlbums() ->[Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(_ album:Album,index:Int) {
        persistencyManager.addAlbum(album, index: index)
        if  isOnline {
            let _ = httpClient.postRequest("/api/addAlbum", body: album.description)
            
        }
    }
    
    func deleteAlbum(_ index:Int) {
        persistencyManager.deleteAlbumAtIndex(index)
        if isOnline {
            let _ = httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
    
   @objc func downloadImage(_ notification:Notification) {
    guard let userInfo = notification.userInfo,
        let imageView = userInfo["imageView"] as? UIImageView,
        let coverURL = userInfo["coverUrl"] as? String,
        let filename = URL(string: coverURL)?.lastPathComponent else {
        return
    }
    
    if let savedImage = persistencyManager.getImage(with: filename) {
        imageView.image = savedImage
        return
    }
    
    DispatchQueue.global().async {
        let downloadedImage = self.httpClient.downloadImage(coverURL as String)
        DispatchQueue.main.async {
            imageView.image = downloadedImage
            self.persistencyManager.saveImage(downloadedImage, fileName: URL(string: coverURL)!.lastPathComponent)
        }
    }
    }
    
    func saveAlbums() {
        persistencyManager.saveAlbums()
    }
}

extension Selector
{
    static let downloadImage = #selector(LibraryAPI.downloadImage(_:))
}
































