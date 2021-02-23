//
//  MainTabBar.swift
//  TheBridge
//
//  Created by Devon Adams on 12/29/20.
//

import SwiftUI

struct MainTabBar: View {
    
    init(){
        UITabBar.appearance().barTintColor = UIColor.black
        
    }
    var body: some View {
            TabView{
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                }
                .hiddenNavigationBarStyle()
                SearchView().tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .hiddenNavigationBarStyle()
                AddArticle().tabItem {
                    Image(systemName: "plus")
                }
                .hiddenNavigationBarStyle()
                LikeView().tabItem {
                    Image(systemName: "heart")
                }
                .hiddenNavigationBarStyle()
                ProfileView().tabItem {
                    Image(systemName: "person.circle")
                }
                .hiddenNavigationBarStyle()
            }.accentColor(Color("MassesGreen"))
            .hiddenNavigationBarStyle()
        }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
