//
//  HomeCells.swift
//  TheBridge
//
//  Created by Devon Adams on 12/22/20.
//

import Foundation
import UIKit

class HomeCells: BaseCell{
    let cellid = "homeCell"
    
    var item: RSSItem! {
        didSet{
            title.text = item.title
            subText.text = item.description
            image.load(url: URL(string: item.image)!)
        }
    }
    
    let title: UILabel = {
       let label = UILabel()
        label.text = "Oldest Black Fraternity marches on Washington"
        label.font = UIFont(name: "PatuaOne-Regular", size: 35)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subText: UILabel = {
        let label = UILabel()
        label.text = "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud ame"
        label.font = UIFont(name: "PatuaOne-Regular", size: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "AlphaPhiAlphaMarch")
        iv.contentMode = UIView.ContentMode.scaleAspectFit

        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(title)
        addSubview(subText)
        addSubview(image)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: title)
        addConstraintsWithFormat(format: "H:|[v0]|", views: subText)
        addConstraintsWithFormat(format: "H:|[v0]|", views: image)
        addConstraintsWithFormat(format: "V:|[v0(90)]-8-[v1(90)]-8-[v2]|", views: title,subText,image)
    }
}
