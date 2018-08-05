//
//  MasterViewController.swift
//  Swift_180115_06
//
//  Created by 戴运鹏 on 2018/1/15.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController:DetailViewController? = nil
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchController = UISearchController.init(searchResultsController: nil)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candies = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear")
        ]
        
        setupSearchController()
        
        if let splitViewController = splitViewController {
            let controllers  = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as!UINavigationController).topViewController as? DetailViewController
            
        }
    }

    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
    }
    
    func filterContentSearchText(_ searchText:String,scope:String = "All")  {
        filteredCandies = candies.filter{ candy in
            if (candy.category == scope) && scope != "All"{
                return false
            }
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredCandies.count
        }
        return candies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let candy:Candy
        if searchController.isActive {
            candy = filteredCandies[(indexPath as NSIndexPath).row]
            
        }else{
            candy = candies[(indexPath as NSIndexPath).row]
        }
        cell.textLabel!.text = candy.name
        cell.detailTextLabel?.text = candy.category
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let candy:Candy
                if searchController.isActive{
                    candy = filteredCandies[(indexPath as NSIndexPath).row]
                }else{
                    candy = candies[(indexPath as NSIndexPath).row]
                }
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailCandy = candy
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
                
            }
        }
    }
    
}

extension MasterViewController : UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentSearchText(searchController.searchBar.text!, scope: scope)
        
    }
    
    
}

extension MasterViewController : UISearchBarDelegate
{
     func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}







































