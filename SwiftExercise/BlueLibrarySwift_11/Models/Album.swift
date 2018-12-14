//
//  Album.swift
//  BlueLibrarySwift_11
//
//  Created by 戴运鹏 on 2018/12/14.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit

struct Album:Codable {
    var title:String
    var artist:String
    var genre:String
    var coverUrl:String
    var year:String
}

extension Album:CustomStringConvertible
{
    var description: String {
        return "title:\(title)" + "artist:\(artist)" + "genre:\(genre)" + "coverUrl:\(coverUrl)" + "year:\(year)"
    }
}

typealias AlbumData = (title:String,value:String)
extension Album{
    var tableRepresentation:[AlbumData]{
        return [
            ("Artist",artist),
            ("title",title),
            ("genre",genre),
            ("year",year),
        ]
    }
    
}

