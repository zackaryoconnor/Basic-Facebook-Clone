//
//  ViewController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/8/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellId"

class NewsFeedController: UICollectionViewController, UISearchBarDelegate {
    
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        searchController.hidesNavigationBarDuringPresentation = false
        
        let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textField?.textColor = UIColor.white
        textField?.layer.cornerRadius = 18
        textField?.clipsToBounds = true
        
        return searchController
    }()
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.delegate = self
        
        let buttermilkPost = Post()
        buttermilkPost.name = "Buttermilk O'Connor"
        buttermilkPost.statusText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare lectus sit amet est placerat. Non enim praesent elementum facilisis leo vel fringilla. Rhoncus dolor purus non enim praesent elementum. Proin nibh nisl condimentum id."
        buttermilkPost.profileImageName = "buttermilk_profile"
        buttermilkPost.statusImageName = "buttermilk_posted"
        
        
        let jynxPost = Post()
        jynxPost.name = "Jynx O'Connor"
        jynxPost.statusText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        jynxPost.profileImageName = "jynx_profile"
        jynxPost.statusImageName = "jynx_posted"
        
        [buttermilkPost, jynxPost].forEach { posts.append($0) }
        
        setupNavBarStyle()
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(NewsFeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func setupNavBarStyle() {
        navigationController?.navigationBar.barTintColor = facebookBlue
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        navigationItem.titleView = searchController.searchBar
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "messenger_icon"), style: .plain, target: self, action: #selector(handleMessengerButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "sent-mail"), style: .plain, target: self, action: #selector(handleShareButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc func handleMessengerButtonPressed() {
        present(MessengerController(), animated: true, completion: nil)
    }
    
    @objc func handleShareButtonPressed() {
        present(ShareController(), animated: true, completion: nil)
    }
}


extension NewsFeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? NewsFeedCell {
            
            cell.post = posts[indexPath.item]
            
            return cell
        }
        return UICollectionViewCell()
    }
}

extension NewsFeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18, weight: .regular)], context: nil)
            
            let knownHeight: CGFloat = 460
            
            if UIDevice.current.orientation.isPortrait {
                return CGSize(width: view.frame.width, height: rect.height + knownHeight)
            } else if UIDevice.current.orientation.isLandscape {
                return CGSize(width: view.frame.width, height: rect.height + knownHeight + 12)
            }
            

        }
        return CGSize(width: view.frame.width, height: 600)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
}












