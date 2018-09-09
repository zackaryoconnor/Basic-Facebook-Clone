//
//  Cell.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/8/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        return label
    }()
    
    
    
    let statustextLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        return label
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    
    func setupView() {
        backgroundColor = .white
        [profileImageView, nameLabel, dateLabel, statustextLabel, statusImageView].forEach { addSubview($0) }
        
        profileImageView.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        
        nameLabel.addAnchors(top: topAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: frame.width, height: 20))
        
        dateLabel.addAnchors(top: nameLabel.bottomAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: frame.width, height: 20))
        
        
        statustextLabel.addAnchors(top: profileImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 8, bottom: 0, right: 8), size: .init(width: frame.width, height: 50))
        
        statusImageView.addAnchors(top: statustextLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

















