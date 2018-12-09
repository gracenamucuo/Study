//
//  ViewController.swift
//  PlayVideo_03
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data = [
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    var playViewController = AVPlayerViewController()
    var playView = AVPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.register(UINib.init(nibName: "Main", bundle: Bundle.main), forCellReuseIdentifier: "CellID")
        tableView.rowHeight = 200
        
    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate,CellPlayProtocol
{
    func didPlayActionClick() {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! VideoCell
        let video = data[indexPath.row]
        cell.bottomImageView.image = UIImage.init(named: video.image)
        cell.sourceLabel.text = video.source
        cell.titleLabel.text = video.title
        cell.delegate = self
        return cell
    }
    
    
}
