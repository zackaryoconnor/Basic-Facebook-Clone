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
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Buttermilk O'Connor"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "September 8"
        label.textColor = .lightGray
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "• Las Vegas •"
        label.textColor = .lightGray
        return label
    }()
    
    let publicStatusLabel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "globe_small")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let statusTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultricies mi quis hendrerit dolor magna eget."
        return label
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "posted")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let numberOfLikesAndComments: UILabel = {
        let label = UILabel()
        label.text = "2515 Likes     1459 Comments"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 226/255, green: 228/255, blue: 232/255, alpha: 1)
        return view
    }()
    
    let likeButton = Cell.buttonForTitle(title: "Like", imageName: "like")
    let commentButton = Cell.buttonForTitle(title: "Comment", imageName: "comment")
    let shareButton = Cell.buttonForTitle(title: "Share", imageName: "share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.init(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return button
}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        
        let buttonWidth = 115
        let buttonHeight = 45
        
        [profileImageView, nameLabel, dateLabel, locationLabel, publicStatusLabel, statusTextLabel, statusImageView, numberOfLikesAndComments, dividerLine, likeButton, commentButton, shareButton].forEach { addSubview($0) }
        
        profileImageView.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        
        nameLabel.addAnchors(top: topAnchor, leading: profileImageView.trailingAnchor, bottom: dateLabel.topAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
        
        dateLabel.addAnchors(top: nameLabel.bottomAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: locationLabel.leadingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
        
        locationLabel.addAnchors(top: nameLabel.bottomAnchor, leading: dateLabel.trailingAnchor, bottom: nil, trailing: publicStatusLabel.leadingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8))
        
        publicStatusLabel.addAnchors(top: nameLabel.bottomAnchor, leading: locationLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0), size: .init(width: 16, height: 16))
        
        statusTextLabel.addAnchors(top: profileImageView.bottomAnchor, leading: leadingAnchor, bottom: statusImageView.topAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 8, bottom: 8, right: 8))
        
        statusImageView.addAnchors(top: statusTextLabel.bottomAnchor, leading: leadingAnchor, bottom: numberOfLikesAndComments.topAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
        numberOfLikesAndComments.addAnchors(top: statusImageView.bottomAnchor, leading: leadingAnchor, bottom: dividerLine.topAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: frame.width, height: 45))
        
        dividerLine.addAnchors(top: numberOfLikesAndComments.bottomAnchor, leading: leadingAnchor, bottom: commentButton.topAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 8), size: .init(width: frame.width, height: 1))
        
        likeButton.addAnchors(top: commentButton.topAnchor, leading: nil, bottom: commentButton.bottomAnchor, trailing: commentButton.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8), size: .init(width: buttonWidth, height: buttonHeight))
        
        commentButton.addAnchors(top: dividerLine.bottomAnchor, leading: likeButton.trailingAnchor, bottom: bottomAnchor, trailing: shareButton.leadingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .init(width: buttonWidth, height: buttonHeight))
        commentButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        shareButton.addAnchors(top: commentButton.topAnchor, leading: commentButton.trailingAnchor, bottom: commentButton.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: buttonWidth, height: buttonHeight))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

















