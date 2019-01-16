//
//  Cell.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/8/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class NewsFeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            if let name = post?.name {
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18, weight: .semibold)])
                attributedText.append(NSAttributedString(string: "\nSeptember 3 • Las Vegas • ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor : UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 2
                
                attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe_small")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributedText
            }
            
            if let statusText = post?.statusText {
                statusTextLabel.text = statusText
            }
            
            if let profileImageName = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImageName)
            }
            
            if let statusImageName = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImageName)
            }
        }
    }
    
    let profileImageView = ImageViews(_image: nil, _cornerRadius: 25)
    
    let nameLabel = Labels(title: "", color: .black, fontSize: 18, fontWeight: .semibold, alignment: .left, lines: 1)
    
    let dateLabel = Labels(title: "September 8", color: .lightGray, fontSize: 16, fontWeight: .regular, alignment: .left, lines: 1)
    
    let locationLabel = Labels(title: "• Las Vegas •", color: .lightGray, fontSize: 16, fontWeight: .regular, alignment: .left, lines: 1)
    
    let publicStatusLabel = ImageViews(_image: "globe_small", _cornerRadius: 0)
    
    let statusTextLabel = Labels(title: "", color: .black, fontSize: 17, fontWeight: .regular, alignment: .left, lines: 0)
    
    let statusImageView = ImageViews(_image: nil, _cornerRadius: 2)
    
    let numberOfLikesAndComments = Labels(title: "2515 Likes     1459 Comments", color: .black, fontSize: 14, fontWeight: .regular, alignment: .left, lines: 1)
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 226/255, green: 228/255, blue: 232/255, alpha: 1)
        return view
    }()
    
    let likeButton = NewsFeedCell.buttonForTitle(title: "Like", imageName: "like")
    let commentButton = NewsFeedCell.buttonForTitle(title: "Comment", imageName: "comment")
    let shareButton = NewsFeedCell.buttonForTitle(title: "Share", imageName: "share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.init(red: 143/255, green: 150/255, blue: 163/255, alpha: 1), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return button
    }
    
    let containerView = LikeEmojisContainerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLongPressGesture()
    }
    
    func setupLongPressGesture() {
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            handleGestureBegan(gesture: gesture)
        } else if gesture.state == .ended {
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                let stackView = self.containerView.subviews.first
                stackView?.subviews.forEach({ (imageView) in
                    imageView.transform = .identity
                })
                
                self.containerView.transform.translatedBy(x: 0, y: 50)
                self.containerView.alpha = 0
            }, completion: { (_) in
                self.containerView.removeFromSuperview()
            })
            
        } else if gesture.state == .changed {
            handleGestureChanged(gesture: gesture)
        }
    }
    
    func handleGestureBegan(gesture: UILongPressGestureRecognizer) {
        addSubview(containerView)
        let pressedLocation = gesture.location(in: self)
        let centeredX = (frame.width - containerView.frame.width) / 2
        
        containerView.alpha = 0
        containerView.transform = CGAffineTransform(translationX: centeredX, y: pressedLocation.y)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.containerView.alpha = 1
            self.containerView.transform = CGAffineTransform(translationX: centeredX, y: pressedLocation.y - self.containerView.frame.height - 25)
        }, completion: nil)
    }
    
    func handleGestureChanged(gesture: UILongPressGestureRecognizer) {
        let pressedLocation = gesture.location(in: self.containerView)
        print(pressedLocation)
        
        let fixedYLocation = CGPoint(x: pressedLocation.x, y: self.containerView.frame.height / 2)
        
        let hitTestView = containerView.hitTest(fixedYLocation, with: nil)
        
        if hitTestView is UIImageView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                let stackView = self.containerView.subviews.first
                stackView?.subviews.forEach({ (imageView) in
                    imageView.transform = .identity
                })
                
                hitTestView?.transform = CGAffineTransform(translationX: 0, y: -50)
            }, completion: nil)
        }
    }
    
    func setupView() {
        backgroundColor = .white
        
        [profileImageView, nameLabel, dateLabel, locationLabel, publicStatusLabel, statusTextLabel, statusImageView, numberOfLikesAndComments, dividerLine, likeButton, commentButton, shareButton].forEach { addSubview($0) }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let buttonWidth = 115
        let buttonHeight = 45
        
        profileImageView.addAnchors(top: topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        
        nameLabel.addAnchors(top: topAnchor, leading: profileImageView.trailingAnchor, bottom: dateLabel.topAnchor, trailing: trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
        
        dateLabel.addAnchors(top: nameLabel.bottomAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: locationLabel.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
        
        locationLabel.addAnchors(top: nameLabel.bottomAnchor, leading: dateLabel.trailingAnchor, bottom: nil, trailing: publicStatusLabel.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 8))
        
        publicStatusLabel.addAnchors(top: nameLabel.bottomAnchor, leading: locationLabel.trailingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0), size: .init(width: 16, height: 16))
        
        statusTextLabel.addAnchors(top: profileImageView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: statusImageView.topAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 16, left: 8, bottom: 8, right: 8))
        
        statusImageView.addAnchors(top: statusTextLabel.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: numberOfLikesAndComments.topAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 8, left: 0, bottom: 8, right: 0), size: .init(width: frame.width, height: 250))
        
        numberOfLikesAndComments.addAnchors(top: statusImageView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: dividerLine.topAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: frame.width, height: 45))
        
        dividerLine.addAnchors(top: numberOfLikesAndComments.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: commentButton.topAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 0, left: 8, bottom: 8, right: 8), size: .init(width: frame.width, height: 1))
        
        likeButton.addAnchors(top: commentButton.topAnchor, leading: nil, bottom: commentButton.bottomAnchor, trailing: commentButton.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 8), size: .init(width: buttonWidth, height: buttonHeight))
        
        commentButton.addAnchors(top: dividerLine.bottomAnchor, leading: likeButton.trailingAnchor, bottom: bottomAnchor, trailing: shareButton.leadingAnchor, centerX: centerXAnchor, centerY: nil, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .init(width: buttonWidth, height: buttonHeight))
        
        shareButton.addAnchors(top: commentButton.topAnchor, leading: commentButton.trailingAnchor, bottom: commentButton.bottomAnchor, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: buttonWidth, height: buttonHeight))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
