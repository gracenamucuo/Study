//
//  FBMeUser.swift
//  Swift_180228_08
//
//  Created by 戴运鹏 on 2018/2/28.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

class FBMeUser {
    var name:String
    var avatarName:String
    var education:String
    
    init(name:String,avatarName:String = "bayMax",education:String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
 
}



