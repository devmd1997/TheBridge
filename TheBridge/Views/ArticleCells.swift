//
//  ArticleCells.swift
//  TheBridge
//
//  Created by Devon Adams on 12/28/20.
//

import Foundation
import UIKit

class ArticleCell: BaseCell {
    let cellId = "articleCell"
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "trump2")
        iv.contentMode = UIView.ContentMode.scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let overlay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "This man is a complete clown"
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saves: UILabel = {
        let label = UILabel()
        label.text = "2016 saves"
        label.font = UIFont(name: "Poppins-Regular", size: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(image)
        addConstraintsWithFormat(format: "H:|[v0]|", views: image)
        addConstraintsWithFormat(format: "V:|[v0]|", views: image)
        
        image.addSubview(overlay)
        image.addConstraintsWithFormat(format: "H:|[v0]|", views: overlay)
        image.addConstraintsWithFormat(format: "V:|[v0]|", views: overlay)
        
        image.addSubview(title)
        image.addSubview(saves)
        
        image.addConstraintsWithFormat(format: "H:|-13-[v0]-13-|", views: title)
        image.addConstraintsWithFormat(format: "H:|-13-[v0]-13-|", views: saves)
        image.addConstraintsWithFormat(format: "V:|-229-[v0(16)]-8-[v1(15)]-32-|", views: title, saves)
    }
}
