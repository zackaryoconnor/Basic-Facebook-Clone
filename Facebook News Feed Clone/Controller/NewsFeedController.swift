//
//  ViewController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/8/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

public let facebookBlue = UIColor(red: 51/255, green: 90/255, blue: 149/255, alpha: 1.0)
private let reuseIdentifier = "CellId"

class Post {
    var name: String?
    var statusText: String?
    var profileImageName: String?
    var statusImageName: String?
    var numLikes: Int?
    var numComments: Int?
}

class NewsFeedController: UICollectionViewController {
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func setupNavBarStyle() {
        navigationItem.title = "Feed"
        navigationController?.navigationBar.barTintColor = facebookBlue
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
}


extension NewsFeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? Cell {
            
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












