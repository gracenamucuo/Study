//
//  Models.swift
//  RxSwiftDemo
//
//  Created by 戴运鹏 on 2018/12/2.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import RxSwift
import Foundation



struct MusicListViewModel {
    let data = Observable.just([
        Music.init(name: "无条件", singer: "陈奕迅"),
        Music.init(name: "你好", singer: "歌手B"),
        Music.init(name: "歌曲3", singer: "歌手C"),
        Music.init(name: "歌曲4", singer: "歌手D")
        ])
    
}

