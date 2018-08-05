//
//  FeedParser.swift
//  Swift_180116_06
//
//  Created by 戴运鹏 on 2018/1/16.
//  Copyright © 2018年 戴运鹏. All rights reserved.
//

import Foundation

class FeedParser:NSObject,XMLParserDelegate {
    fileprivate var rssItems = [(title:String,description:String,pubDate:String)]()
    fileprivate var currentElement = ""
    fileprivate var currentTitle = ""{
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    fileprivate var currtentDescription = ""{
        didSet{
            currtentDescription = currtentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    fileprivate var currentPubDate = ""{
        didSet{
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    fileprivate var parserCompletionHandler:(([(title:String,description:String,pubDate:String)])->Void)?
    
    func parseFeed(feedURL:String,completionHandler:(([(title:String,description:String,pubDate:String)])->Void)?) -> Void {
        parserCompletionHandler = completionHandler
        guard let feedURL = URL.init(string: feedURL) else{
            print("feed URL is invalid")
            return
        }
        
        URLSession.shared.dataTask(with: feedURL) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else{
                print("NO data fetched")
                return
            }
            
            let parser = XMLParser.init(data: data)
            parser.delegate = self
            parser.parse()
            
        }.resume()
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        rssItems.removeAll()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currtentDescription = ""
            currentPubDate = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += string
        case "descripiton":
            currtentDescription += string
        case "pubDate":
            currentPubDate += string
        default:
            break
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = (title:currentTitle,description:currtentDescription,pubDate:currentPubDate)
            rssItems.append(rssItem)
            
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}







































































































































































