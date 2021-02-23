//
//  SearchViewController.swift
//  TheBridge
//
//  Created by Devon Adams on 12/29/20.
//

import SwiftUI
import UIKit

class SearchViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct SearchViewBridge: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SearchViewController {
        return SearchViewController()
    }
    
    func updateUIViewController(_ uiViewController: SearchViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = SearchViewController
    
    
}

struct SearchView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("What do you\nwanna see?")
                .font(.custom("PatuaOne-Regular", size: 35))
                .foregroundColor(Color("MassesGreen"))
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            List{
                Text("Business")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Entertainment")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Finance")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Politics")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Global Affairs")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Sports")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Local")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Opinion")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Tech")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
                Text("Travel")
                    .font(.custom("PatuaOne-Regular", size: 25))
                    .padding(.top)
            }
        }
    }
}

struct SearchViewController_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
