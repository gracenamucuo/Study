//
//  ArtistDetailViewController.swift
//  Swift_180107_05
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ArtistDetailViewController: UIViewController {
    
    var selectedArtist: Artists!
    let moreInfoText = "Select For More Info >"
    
    @IBOutlet weak var detailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = 300
//        detailTableView.rowHeight = 300;
        
        
        
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.detailTableView.reloadData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ArtistDetailViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorkTableViewCell
        let work = selectedArtist.works[indexPath.row]
        cell.nameLabel.text = work.title
        cell.workImageView.image = work.image
        
        cell.nameLabel.backgroundColor = UIColor.init(white: 204 / 255, alpha: 1)
        cell.nameLabel.textAlignment = .center
        
        cell.textView.textColor = UIColor.init(white: 114 / 255, alpha: 1)
        cell.selectionStyle = .none
        
        cell.textView.text = work.isExpanded ? work.info : moreInfoText
        cell.textView.textAlignment = work.isExpanded ? .left : .center
        
        cell.nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.textView.font = UIFont.preferredFont(forTextStyle: .footnote)
        return cell
    }
}

extension ArtistDetailViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WorkTableViewCell else {
            return
        }
        var work = selectedArtist.works[indexPath.row]
        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        
        cell.textView.text = work.isExpanded ? work.info : moreInfoText
        cell.textView.textAlignment = work.isExpanded ? .left : .center
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}





































































































































































