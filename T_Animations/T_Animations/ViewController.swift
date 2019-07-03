//
//  ViewController.swift
//  T_Animations
//
//  Created by dyp on 2019/7/3.
//  Copyright © 2019 dyp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["AutoLayoutAnimationsController","KeyboardAnimationController"]
        
    }
    

}

extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = UIViewController.init()
        switch indexPath.row {
        case 0:
            vc = AutoLayoutAnimationsController()
            break
        case 1:
            vc = KeyboardAnimationController()
            break
        default: break
        }
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

//extension NSObject {
//    // create a static method to get a swift class for a string name
//    class func swiftClassFromString(className: String) -> AnyClass! {
//        // get the project name
//        if  var appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
//            // generate the full name of your class (take a look into your "YourProject-swift.h" file)
//
//            let classStringName = "_TtC\(appName.)\(String(describing: appName))\(countElements(className))\(className)"
//            // return the class!
//            return NSClassFromString(classStringName)
//        }
//        return nil;
//    }
//}
//let clsStr = items[indexPath.row]
//
//let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
//let vcName = items[indexPath.row]
//
//let cls = NSClassFromString(clsName! + "." + vcName) as? UIViewController.Type
//
//print(cls)
