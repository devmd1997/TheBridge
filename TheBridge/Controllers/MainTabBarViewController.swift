//
//  MainTabBarViewController.swift
//  TheBridge
//
//  Created by Devon Adams on 12/29/20.
//

import UIKit
import SwiftUI

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let vc1 = HomeViewController()
        let vc2 = ProfileViewController()
        let vc3 = SearchViewController()
        let icon1 = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let icon2 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        let icon3 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        vc1.tabBarItem = icon1
        vc2.tabBarItem = icon2
        vc3.tabBarItem = icon3
        let controllers = [vc1,vc3,vc2]
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "")?")
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct MainTabBarPreviews: PreviewProvider {
    static var previews: some View{
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: MainTabBarViewController())
            
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        
        typealias  UIViewControllerType = UIViewController
    }
}

struct TabBarView: View {
    var body: some View {
        Text("Hello World")
    }
}
