//
//  Command.swift
//  Appdelegate解耦
//
//  Created by 戴运鹏 on 2019/2/13.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation

protocol Command {
    func execute()
}

class InitializeThirdPartiesCommand: Command {
    func execute() {
        print("初始化第三方")
    }
}

class InitializeNotificationCommand: Command {
    func execute() {
        print("初始化远程通知")
    }
}

class InitializeUICommand: Command {
    func execute() {
        print("初始化UI")
    }
}

public class CommandManager{
    
  static func buildCommands() -> [Command] {
    return [InitializeThirdPartiesCommand(),InitializeNotificationCommand(),InitializeUICommand()]
    }
            
}
