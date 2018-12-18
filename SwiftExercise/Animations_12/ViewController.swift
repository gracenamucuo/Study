//
//  ViewController.swift
//  Animations_12
//
//  Created by 戴运鹏 on 2018/12/17.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

let headerHeight = 50.0
let segueDetailIdentifier = "toAnimateDetail"
let duration = 1.5

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Variables
   fileprivate let items = ["2-Color","Simple 2D Rotation","Multicolor","Multi Point Position","BezierCurve Position","Color and Frame Change","View Fade In","Pop"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }

    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: duration, delay: 0.05*Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            }, completion: nil)
            index += 1
        }
        
        
        
    }

    //MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetailIdentifier {
            let detailView = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath{
                detailView.barTitle = self.items[index.row]
            }
            
        }
    }
    
}
//MARK: -UITableViewDelegate
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }
}
//MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    
}

































