//
//  LiveController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/19/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit
class LiveController: UIViewController {
    let controllerNameLabel = Labels(title: "Live Controller", color: .black, fontSize: 36, fontWeight: .bold, alignment: .center, lines: 0)
    
    let tapScreenLabel = Labels(title: "(tap the screen to see animations)", color: .black, fontSize: 18, fontWeight: .regular, alignment: .center, lines: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        setupConstraints()
        setupCurvedView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }
    
    func setupConstraints() {
        [controllerNameLabel, tapScreenLabel].forEach { view.addSubview($0) }
        
        
        controllerNameLabel.addAnchors(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
        tapScreenLabel.addAnchors(top: controllerNameLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil)
    }
    
    func setupCurvedView() {
        let curvedView = CurvedView()
        curvedView.backgroundColor = .clear
    }
    
    @objc func handleTapGesture() {
        (0...10).forEach { (_) in
            generateAnimatedViews()
        }
    }
    
    fileprivate func generateAnimatedViews() {
        let image = drand48() > 0.5 ? UIImage(named: "thumbs_up") : UIImage(named: "heart")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        //        animation.timingFunctions = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    }
}
