//
//  LikeEmojisContainerView.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 1/8/19.
//  Copyright © 2019 Zackary O'Connor. All rights reserved.
//

import UIKit

class LikeEmojisContainerView: UIView {
    let iconHeight: CGFloat = 42
    let padding: CGFloat = 6
    let emojis = [#imageLiteral(resourceName: "thumbs_up"), #imageLiteral(resourceName: "heart"), #imageLiteral(resourceName: "surprised"), #imageLiteral(resourceName: "cry_laugh"), #imageLiteral(resourceName: "cry"), #imageLiteral(resourceName: "angry")]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        let arrangedSubViews = emojis.map({ (emoji) -> UIView in
            let view = UIImageView(image: emoji)
            view.layer.cornerRadius = iconHeight / 2
            return view
        })
        
        let emojiStackView = UIStackView(arrangedSubviews: arrangedSubViews)
        emojiStackView.distribution = .fillEqually
        emojiStackView.spacing = padding
        emojiStackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        emojiStackView.isLayoutMarginsRelativeArrangement = true
        
        addSubview(emojiStackView)
        
        let numberOfIcons = CGFloat(arrangedSubViews.count)
        let width = numberOfIcons * iconHeight + (numberOfIcons + 1) * padding
        
        frame = CGRect(x: 0, y: 0, width: width, height: iconHeight + 2 * padding)
        layer.cornerRadius = frame.height / 2
        
        backgroundColor = .white
        frame = CGRect(x: 0, y: 0, width: width, height: iconHeight + 2 * padding)
        
        layer.shadowColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
        
        emojiStackView.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
