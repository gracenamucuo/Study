//
//  Artists.swift
//  Swift_180107_05
//
//  Created by 戴运鹏 on 2018/1/7.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import UIKit

struct Artists {
    let name:String
    let bio:String
    let image:UIImage
    var works:[Work]
    
    init(name:String,bio:String,image:UIImage,works:[Work]) {
        self.name = name
        self.bio = bio
        self.image = image
        self.works = works
    }
    
    static func artistsFromBundle() -> [Artists]{
        var artists = [Artists]()
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return artists
        }
        
        do {
            let data = try Data(contentsOf:url)
            guard let rootOnject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as?[String:Any] else {
                return artists
            }
            
            guard let artistsObjects = rootOnject["artists"] as?[[String:AnyObject]] else {
                return artists
            }
            
            for artistObject in artistsObjects {
                if let name = artistObject["name"] as? String,
                    let bio = artistObject["bio"] as? String,
                let imageName = artistObject["image"] as? String,
                let image = UIImage.init(named:imageName),
                let worksObject = artistObject["works"] as? [[String:String]]{
                    var works = [Work]()
                    for workObject in worksObject{
                        if let workTitle = workObject["title"],
                        let workImageName = workObject["image"],
                        let workImage = UIImage.init(named: workImageName + ".jpg"),
                        let info = workObject["info"]{
                            works.append(Work.init(title: workTitle,image: workImage,info:info,isExpanded:false))
                        }
                }
                    let artist = Artists.init(name: name, bio: bio, image: image, works: works)
                    
                
                artists.append(artist)
                }
                
            }
            
        }catch {
            return artists
        }
        
        return artists
    }
    
}
























































































































