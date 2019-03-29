//
//  ViewController.swift
//  TestRepo
//
//  Created by 戴运鹏 on 2018/12/25.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import PKHUD

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    var mask = UIView()
    var timer:Timer?
    
    
    let data = ["空白table","空白collection","文字","图片"]
    
    @IBOutlet weak var loadingView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.dimsBackground = false
        tableView.tableFooterView = UIView()
        tableView.reloadData()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            
            self.navigationController?.navigationBar.isTranslucent = false
        }
        
        mask.backgroundColor = UIColor.lightGray
        mask.frame = loadingView.frame
        bottomView.addSubview(mask)

    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        mask.layer.add(ETHUDAnimation.loading, forKey: nil)
    }
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
        
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let refresh = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmptyTableController")
            self.navigationController?.pushViewController(refresh, animated: true)
        case 1:

            let snp = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmptyCollectionController")
            self.navigationController?.pushViewController(snp, animated: true)
        case 2:
            let frame = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FrameController")
            self.navigationController?.pushViewController(frame, animated: true)
        case 3:
            let scroll = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScrollController")
            self.navigationController?.pushViewController(scroll, animated: true)
            
        default:
            HUD.show(.progress)
            HUD.hide(afterDelay: 2)
        }
        

        
        
    }
    
    
}

extension ViewController{
   @objc func animation() {
    UIView.animate(withDuration: 0.5, animations: {
        self.mask.frame = CGRect(x: 210, y: 50, width: 110, height: 20)
    }) { (fin) in
        self.mask.frame = CGRect(x: 100, y: 50, width: 110, height: 20)
    }
    }
}































































