//
//  MVVM.swift
//  MVX_Demo
//
//  Created by 戴运鹏 on 2019/2/20.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation
import UIKit
struct Person {
    let firstName:String
    let lastName:String
}

 protocol GreetingViewModelProtocol:class  {
    var greeting:String? {get}
    var greetingDidChange:((GreetingViewModelProtocol) -> ())? {get set}
    init(person:Person)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    let person:Person
    var greeting: String?{
        didSet {
            self.greetingDidChange?(self)
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    required init(person: Person) {
        self.person = person
    }
   func showGreeting() {
        self.greeting = "hello" + " " + self.person.firstName + self.person.lastName
    }
    
}

class GreetingViewController: UIViewController {
    
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()

    var viewModel:GreetingViewModelProtocol!{
        didSet{
            self.viewModel.greetingDidChange = {[unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self.viewModel, action: Selector("showGreeting"), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}
