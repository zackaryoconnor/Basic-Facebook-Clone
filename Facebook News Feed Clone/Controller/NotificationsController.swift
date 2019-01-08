//
//  NotificationsController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/19/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {
    let controllerNameLabel = Labels(title: "Notifications Controller", color: .black, fontSize: 36, fontWeight: .bold, alignment: .center, lines: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(controllerNameLabel)
        
        controllerNameLabel.addAnchors(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
    }
}
