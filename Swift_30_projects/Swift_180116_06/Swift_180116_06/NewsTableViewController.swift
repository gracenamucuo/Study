//
//  NewsTableViewController.swift
//  Swift_180116_06
//
//  Created by 戴运鹏 on 2018/1/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    fileprivate let feedParser = FeedParser()
    fileprivate let feedURL = "http://www.apple.com/main/rss/hotnews/hotnews.rss"
    fileprivate var rssItems:[(title:String,description:String,pubDate:String)]?
    fileprivate var cellStates:[CellState]?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        feedParser.parseFeed(feedURL: feedURL) { [weak self] rssItems in
            self?.rssItems = rssItems
            self?.cellStates = Array.init(repeating: .collapsed, count: rssItems.count)
            DispatchQueue.main.async {
                self?.tableView.reloadSections(IndexSet.init(integer: 0), with: .none)
            }
        }
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        return rssItems.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        if let item = rssItems?[indexPath.row] {
            (cell.titleLabel.text,cell.descriptionLabel.text,cell.dateLabel.text) = (item.title,item.description,item.pubDate)
            
            if let cellState = cellStates?[indexPath.row]{
                cell.descriptionLabel.numberOfLines = cellState == .expanded ? 0 : 4
            }
        }

       

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        tableView.beginUpdates()
        cell.descriptionLabel.numberOfLines = cell.descriptionLabel.numberOfLines == 4 ? 0 : 4
        cellStates?[indexPath.row] = cell.descriptionLabel.numberOfLines == 4 ? .collapsed : .expanded
        tableView.endUpdates()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
