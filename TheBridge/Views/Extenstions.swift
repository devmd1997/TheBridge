//
//  Extenstions.swift
//  TheBridge
//
//  Created by Devon Adams on 12/22/20.
//

import Foundation
import UIKit
import SwiftUI

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView]()
        for(index,view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationBarTitle("")
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
class BaseCell: UICollectionViewCell{
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupViews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func setupViews() {
        
    }
}
