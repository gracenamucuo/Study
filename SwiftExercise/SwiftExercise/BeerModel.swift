//
//  BeerModel.swift
//  SwiftExercise
//
//  Created by 戴运鹏 on 2018/12/2.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import Foundation

enum BeerStyle:String,Codable {
    case ipa
    case stout
    case kolsh
}

struct Beer:Codable{
    let name:String
    let brewery:String
    let style:BeerStyle
    

}


