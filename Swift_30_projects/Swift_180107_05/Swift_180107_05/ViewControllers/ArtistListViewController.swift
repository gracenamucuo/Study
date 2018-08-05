//
//  ArtistListViewController.swift
//  Swift_180107_05
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {

    let artists = Artists.artistsFromBundle()
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.rowHeight = UITableViewAutomaticDimension
        listTableView.estimatedRowHeight = 140
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.listTableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArtistDetailViewController, let indexPath = listTableView.indexPathForSelectedRow {
            destination.selectedArtist = artists[indexPath.row]
        }
    }

}

extension ArtistListViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArtistTableViewCell
        
        let artist = artists[indexPath.row]
        cell.bioLabel.text = artist.bio
        cell.bioLabel.textColor = UIColor.init(white: 114 / 225, alpha: 1)
        
        cell.picImageView.image = artist.image
        cell.nameLabel.text = artist.name
        
        cell.nameLabel.backgroundColor = UIColor.init(red: 1, green: 152 / 255, blue: 0, alpha: 1)
        cell.nameLabel.textAlignment = .center
        cell.selectionStyle = .none
        
        cell.nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.bioLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        return cell
    }
}






























































































