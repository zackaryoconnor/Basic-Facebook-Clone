//
//  ShareController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 1/5/19.
//  Copyright © 2019 Zackary O'Connor. All rights reserved.
//

import UIKit

class ShareController: UIViewController {
    let controllerNameLabel = Labels(title: "Share Controller", color: .black, fontSize: 36, fontWeight: .bold, alignment: .center, lines: 0)
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(handleCloseButtonPressed), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 45 / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        [controllerNameLabel, closeButton].forEach { view.addSubview($0) }
        
        controllerNameLabel.addAnchors(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
        closeButton.addAnchors(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 75, height: 45))
    }
    
    @objc func handleCloseButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}

