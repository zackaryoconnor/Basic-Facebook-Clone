//
//  ViewController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/8/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

public let facebookBlue = UIColor(red: 51/255, green: 90/255, blue: 149/255, alpha: 1.0)
private let reuseId = "reuseID"

class NewsFeedController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
        
        setupNavBarStyles()
    }
    
    func setupNavBarStyles() {
        navigationController?.navigationBar.barTintColor = facebookBlue
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationItem.title = "Feed"
    }
}


extension NewsFeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
}

extension NewsFeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}












