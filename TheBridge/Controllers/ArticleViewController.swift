//
//  ArticleViewController.swift
//  TheBridge
//
//  Created by Devon Adams on 12/28/20.
//

import UIKit
import SwiftUI



class ArticleViewController: UIViewController {
    var rssItem: RSSItem! {
        didSet{
            articleTitle.text = rssItem.title
            text.text = """
 \(rssItem.description)
 """
            headerPicture.load(url: URL(string: rssItem.image)!)
            authorLabel.text = "Author: \(rssItem.author)"
        }
    }
    let articleTitle: UILabel = {
       let label = UILabel()
        label.text = "Trump and first lady tests positive for Corona Virus"
        label.font = UIFont(name: "PatuaOne-Regular", size: 35)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Author: Anthony Wutoh via Washington Post"
        label.font = UIFont(name: "Poppins-Regular", size: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerPicture: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "trump")
        iv.contentMode = UIView.ContentMode.scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let text: UITextView = {
        let text = UITextView()
        text.textAlignment = .justified
        text.text = """
 The president’s result came after he spent months playing down the severity of the outbreak that has killed more than 207,000 in the United States and hours after insisting that “the end of the pandemic is in sight.” WASHINGTON — President Trump said early Friday morning that he and the first lady have tested positive for the coronavirus, throwing the nation’s leadership into uncertainty and escalating the crisis posed by a pandemic that has already killed more than 207,000  Americans and devastated the economy.
            
“Tonight, @FLOTUS and I tested positive for COVID-19,” Mr. Trump wrote on Twitter shortly before 1 a.m. “We will begin our quarantine and recovery process immediately. We will get through this TOGETHER!”
“The president and first lady are both well at this time, and they plan to remain at home within the White House during their convalescence,” the physician, Sean P. Conley, said in a statement without saying how long that would be. “Rest assured I expect the president to continue carrying out his duties without disruption while recovering, and I will keep you updated on any future developments.”

Other aides to the president would not say whether he was experiencing symptoms, but people at the White House noticed that his voice sounded raspy on Thursday, although it was not clear that it was abnormal for him, especially given the number of campaign rallies he has been holding lately.
"""
        text.font = UIFont(name: "PatuaOne-Regular", size: 12)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    private func fetchData(){
        
    }

    func setupViews(){
        view.addSubview(articleTitle)
        view.addSubview(authorLabel)
        view.addSubview(headerPicture)
        view.addSubview(text)
        
        view.addConstraintsWithFormat(format: "H:|-45-[v0]-45-|", views: articleTitle)
        view.addConstraintsWithFormat(format: "H:|-45-[v0]-45-|", views: authorLabel)
        view.addConstraintsWithFormat(format: "H:|-40-[v0]-40-|", views: headerPicture)
        view.addConstraintsWithFormat(format: "H:|-40-[v0]-25-|", views: text)
        
        view.addConstraintsWithFormat(format: "V:|-111-[v0(135)]-7-[v1(18)]-20-[v2(163)]-20-[v3]|", views: articleTitle, authorLabel, headerPicture, text)
    }
}

struct ArticlePreviews: PreviewProvider {
    static var previews: some View{
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: ArticleViewController())
            
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        
        typealias  UIViewControllerType = UIViewController
    }
}

struct ArticleView: View {
    var body: some View {
        Text("Hello World")
    }
}
