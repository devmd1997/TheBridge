//
//  ProfileViewController.swift
//  TheBridge
//
//  Created by Devon Adams on 12/22/20.
//

import UIKit
import SwiftUI
class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        navigationItem.title = "@basically_devon"
//        navigationController?.navigationBar.barTintColor = .white
//        navigationController?.navigationBar.isTranslucent = false
    }
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profilePhoto")
        iv.contentMode = UIView.ContentMode.scaleAspectFit
        iv.layer.cornerRadius = 45
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let subscriberLabel: UILabel = {
        let label = UILabel()
         
        label.text = "1906\nSubscribers"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 13)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    
    let savedMediaLabel: UILabel = {
        let label = UILabel()
         
        label.text = "1977\nSaved Media"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 13)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    
    let followingLabel: UILabel = {
        let label = UILabel()
         
        label.text = "473\nFollowing"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 13)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    let postsLabel: UILabel = {
        let label = UILabel()
         
        label.text = "7\nPosts"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 13)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    
    let editButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(named: "MassesGreen")
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 1.5
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: ProfileViewController.createLayout())
        cv.backgroundColor = .lightGray
        cv.register(ArticleCell.self, forCellWithReuseIdentifier: "myCell")
        cv.dataSource = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    func setUpViews(){
        view.addSubview(profileImage)
        view.addSubview(containerView)
        view.addSubview(editButton)
        view.addSubview(collectionView)
        
        view.addConstraintsWithFormat(format: "H:|-162-[v0(89)]-162-|", views: profileImage)
        view.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: containerView)
        view.addConstraintsWithFormat(format: "H:|-139-[v0(136)]-139-|", views: editButton)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)

        view.addConstraintsWithFormat(format: "V:|-110-[v0(92)]-15-[v1(38)]-20-[v2(28)]-44-[v3]|", views: profileImage,containerView,editButton,collectionView)
        
        containerView.addSubview(subscriberLabel)
        containerView.addSubview(followingLabel)
        containerView.addSubview(savedMediaLabel)
        containerView.addSubview(postsLabel)
        
        containerView.addConstraintsWithFormat(format: "H:|[v0(85)]-15-[v1(77)]-15-[v2(86)]-15-[v3]|", views: subscriberLabel, followingLabel, savedMediaLabel, postsLabel)
        containerView.addConstraintsWithFormat(format: "V:|[v0]|", views: subscriberLabel)
        containerView.addConstraintsWithFormat(format: "V:|[v0]|", views: followingLabel)
        containerView.addConstraintsWithFormat(format: "V:|[v0]|", views: savedMediaLabel)
        containerView.addConstraintsWithFormat(format: "V:|[v0]|", views: postsLabel)
        
    }

}

//MARK: - CollectionView

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        switch indexPath.row{
        case 0:
            cell.backgroundColor = .red
            break
        case 1:
            cell.backgroundColor = .cyan
            break
        case 2:
            cell.backgroundColor = .orange
            break
        case 3:
            cell.backgroundColor = .purple
            break
        default:
            cell.backgroundColor = .red
        }
        
        return cell
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 16
//                item.contentInsets.bottom = 16
//                item.contentInsets.leading = 16
//                item.contentInsets.top = 16
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(294)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
        }
    }
    
}


struct ProfileSamplePreview: PreviewProvider{
    static var previews: some View{
        ProfileView()
    }
}

struct RedIntergratedController: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> ProfileViewController {
        return ProfileViewController()
    }
    
    func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = ProfileViewController
    
    
}

struct ProfileView: View {
    var body: some View{
        RedIntergratedController().edgesIgnoringSafeArea(.all)
    }
}
