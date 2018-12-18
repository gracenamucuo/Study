//
//  ViewController.swift
//  ClassicPhotos_13
//
//  Created by 戴运鹏 on 2018/12/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import CoreImage
let dataSourceURL = URL(string:"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist")
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var photos = [PhotoRecord]()
    let pendingoperations = PendingOperations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Classis Photos"
        fetchPhotoDetails()
    }

   fileprivate func fetchPhotoDetails() {
    let request = URLRequest(url: dataSourceURL!)
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    
    NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { (response, data, error) in
        if let error = error{
            let alert  = UIAlertView(title: "Oops", message:error.localizedDescription, delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            return
        }
        
        if let data = data{
            do {
                if let dataSourceDic = try PropertyListSerialization.propertyList(from: data, options: PropertyListSerialization.ReadOptions(rawValue: 0), format: nil) as? [String:AnyObject]{
                    for (name,url) in dataSourceDic{
                        if let url = URL(string: url as! String){
                            let photoRecord = PhotoRecord(name: name, url: url)
                            self.photos.append(photoRecord)
                        }
                    }
                    self.tableView.reloadData()
                }
            }catch let error as NSError{
                print(error.domain)
            }
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    }

}

extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        if cell.accessoryView == nil {
            let indicator = UIActivityIndicatorView(style: .gray)
            cell.accessoryView = indicator
        }
        let indicator = cell.accessoryView as! UIActivityIndicatorView
        let photoDetails = photos[indexPath.row]
        cell.textLabel?.text = photoDetails.name
        cell.imageView?.image = photoDetails.image
        
        switch photoDetails.state {
        case .Filtered:
            indicator.stopAnimating()
        case .Failed:
            indicator.stopAnimating()
            cell.textLabel?.text = "Failed to load"
        case .Downloaded,.New:
            indicator.startAnimating()
            if (!tableView.isDragging && !tableView.isDecelerating){
                startOperationsForPhotoRecord(photoDetails: photoDetails, indexPath: indexPath)
            }
        }
        return cell
    }
    
}

extension ViewController:UITableViewDelegate
{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        suspendAllOperations()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            loadImagesForOnScreenCells()
            resumeAllOperations()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        loadImagesForOnScreenCells()
        resumeAllOperations()
    }
}

extension ViewController
{
    func startOperationsForPhotoRecord(photoDetails:PhotoRecord,indexPath:IndexPath){
        switch photoDetails.state {
        case .New:
            startDownloadForRecord(photoDetails: photoDetails, indexPath: indexPath)
        case .Downloaded:
            startFiltrationForRecord(photoDetails: photoDetails, indexPath: indexPath)
        default:
            print("")
        }
    }
    
    func startDownloadForRecord(photoDetails:PhotoRecord,indexPath:IndexPath) {
        if let _ = pendingoperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ImageDownloader(photoRecord: photoDetails)
        
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            DispatchQueue.main.async {
                self.pendingoperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
            
        }
        pendingoperations.downloadsInProgress[indexPath] = downloader
        pendingoperations.downloadQueue.addOperation(downloader)
        
        
    }
    
    func startFiltrationForRecord(photoDetails:PhotoRecord,indexPath:IndexPath) {
        if let _ = pendingoperations.filtrationsInProgress[indexPath] {
            return
        }
        let filterer = ImageFiltration(photoRecord: photoDetails)
        filterer.completionBlock = {
            if filterer.isCancelled {
                return
            }
            DispatchQueue.main.async {
                self.pendingoperations.filtrationsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        pendingoperations.filtrationsInProgress[indexPath] = filterer
        pendingoperations.filtrationQueue.addOperation(filterer)
        
        
    }
    
    func suspendAllOperations() {
        pendingoperations.downloadQueue.isSuspended = true
        pendingoperations.filtrationQueue.isSuspended = true
    }
    
    func resumeAllOperations() {
        pendingoperations.downloadQueue.isSuspended = false
        pendingoperations.filtrationQueue.isSuspended = false
    }
    
    func loadImagesForOnScreenCells() {
        if let pathsArray = tableView.indexPathsForVisibleRows {
            var allPendingOperations = Set(pendingoperations.downloadsInProgress.keys)
            allPendingOperations = allPendingOperations.union(pendingoperations.filtrationsInProgress.keys)//并集
            
            var toBeCancelled = allPendingOperations
            let visiblePaths = Set(pathsArray)
            toBeCancelled.subtract(visiblePaths)
            
            var toBeStarted = visiblePaths
            toBeStarted.subtract(allPendingOperations)//去掉在参数集合中的元素
            
            for indexPath in toBeCancelled{
                if let pendingDownload = pendingoperations.downloadsInProgress[indexPath]{
                    pendingDownload.cancel()
                }
                pendingoperations.downloadsInProgress.removeValue(forKey: indexPath)
                
                if let pendingFilteration = pendingoperations.filtrationsInProgress[indexPath]{
                    pendingFilteration.cancel()
                }
                pendingoperations.filtrationsInProgress.removeValue(forKey: indexPath)
                
            }
            
            for indexPath in toBeStarted{
                let recordToProcess = self.photos[indexPath.row]
                startOperationsForPhotoRecord(photoDetails: recordToProcess, indexPath: indexPath)
            }
            
        }
    }
}




















































































































































