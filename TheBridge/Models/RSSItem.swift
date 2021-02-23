//
//  RSSItem.swift
//  TheBridge
//
//  Created by Devon Adams on 1/12/21.
//

import Foundation

struct RSSItem {
    var title: String
    var description: String
    var pubDate: String
    var image: String
    var author: String
}

// download xml from a server
// parse xml to foundation object
// call back

class FeedParser: NSObject, XMLParserDelegate
{
    private var rssItems: [RSSItem] = []
    private var currentElement: String = ""
    private var currentTitle: String = ""{
        didSet{
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = "" {
        didSet{
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = "" {
        didSet{
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentImage: String = "" {
        didSet{
            currentImage = currentImage.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentAuthor: String = "" {
        didSet{
            currentAuthor = currentAuthor.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler: (([RSSItem]) -> Void)?
    
    func parseFeed(url: String, completionHandler: (([RSSItem]) -> Void)?){
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                if let error = error{
                    print(error.localizedDescription)
                }
                return
            }
            // parse our xml data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
            currentImage = ""
            currentAuthor = ""
        }
        if currentElement == "itunes:image" {
            if let imageURL = attributeDict["href"]{
                currentImage += imageURL
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += string
        case "description":
            currentDescription += string
        case "pubDate":
            currentPubDate += string
        case "itunes:image":
            currentImage += string
        case "itunes:author":
            currentAuthor += string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, description: currentDescription, pubDate: currentPubDate, image: currentImage, author: currentAuthor)
            self.rssItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription )
    }
}
