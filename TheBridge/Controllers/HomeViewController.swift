//
//  HomeViewController.swift
//  TheBridge
//
//  Created by Devon Adams on 12/22/20.
//

import UIKit
import SwiftUI
private let reuseIdentifier = "Cell"
private let homeCellId = "homeCell"

private var rssItems: [RSSItem]?


class HomeViewController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: HomeViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func fetchData(){
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://feeds.npr.org/510312/podcast.xml") { (Items) in
            rssItems = Items
            
            OperationQueue.main.addOperation {
                self.collectionView.reloadSections(IndexSet(integer: 0))
            }
        }
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                item.contentInsets.leading = 16
                item.contentInsets.top = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(477)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "The Bridge"
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        let options = UIBarButtonItem(image: UIImage(systemName: "text.alignleft"), style: .plain, target: self, action: nil)
        options.tintColor = .black
        navigationItem.leftBarButtonItems = [options]
        let attributes = [NSAttributedString.Key.font:UIFont(name: "PatuaOne-Regular", size: 20), NSAttributedString.Key.foregroundColor: UIColor(named: "MassesGreen")]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(HomeCells.self, forCellWithReuseIdentifier: homeCellId)
        
        collectionView.backgroundColor = .white
        
        fetchData()
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let rssItems = rssItems else{
            return 0
        }
        return rssItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCellId, for: indexPath) as! HomeCells
        
        if let item = rssItems?[indexPath.item]{
            cell.item = item
        }
        
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ArticleViewController()
        if let item = rssItems?[indexPath.item]{
            vc.rssItem = item
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: UICollectionViewDelegate

}

struct HomeIntegratedController: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
                UINavigationController(rootViewController: HomeViewController())
    
            }
            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
            }
    
            typealias  UIViewControllerType = UIViewController


}

struct HomeView: View{
    var body: some View{
        HomeIntegratedController()
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().edgesIgnoringSafeArea(.all)
    }
}
