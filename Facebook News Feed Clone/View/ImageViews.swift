//
//  ImageViews.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 1/8/19.
//  Copyright © 2019 Zackary O'Connor. All rights reserved.
//

import UIKit

class ImageViews: UIImageView {
    fileprivate let _image: String?
    fileprivate let _cornerRadius: CGFloat
    
    init(_image: String?, _cornerRadius: CGFloat) {
        self._image = _image
        self._cornerRadius = _cornerRadius
        super.init(frame: .zero)
        
        image = UIImage(named: "\(_image)")
        contentMode = .scaleAspectFill
        layer.cornerRadius = _cornerRadius
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
