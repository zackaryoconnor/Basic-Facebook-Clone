//
//  CurvedView.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 1/5/19.
//  Copyright © 2019 Zackary O'Connor. All rights reserved.
//

import UIKit

func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 200))
    
    let endPoint = CGPoint(x: 400, y: 200)
    
    let randomYShift = 200 + drand48() * 300
    let controlPoint1 = CGPoint(x: 100, y: 100 - randomYShift)
    let controlPoint2 = CGPoint(x: 200, y: 300 + randomYShift)
    
    path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    return path
}

class CurvedView: UIView {
    override func draw(_ rect: CGRect) {
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
    }
}
