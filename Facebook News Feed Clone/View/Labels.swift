//
//  DefaultViewControllerLabels.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 1/5/19.
//  Copyright © 2019 Zackary O'Connor. All rights reserved.
//

import UIKit

class Labels: UILabel {
    fileprivate let title: String
    fileprivate let color: UIColor
    fileprivate let fontSize: CGFloat
    fileprivate let fontWeight: UIFont.Weight
    fileprivate let alignment: NSTextAlignment
    fileprivate let lines: Int
    
    init(title: String, color: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight, alignment: NSTextAlignment, lines: Int) {
        self.title = title
        self.color = color
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.alignment = alignment
        self.lines = lines
        super.init(frame: .zero)
        
        text = title
        font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        numberOfLines = 0
        textAlignment = alignment
        textColor = color
        numberOfLines = lines
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
