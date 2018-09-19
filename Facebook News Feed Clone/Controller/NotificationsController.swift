//
//  NotificationsController.swift
//  Facebook News Feed Clone
//
//  Created by Zackary O'Connor on 9/19/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let label: UILabel = {
            let label = UILabel()
            label.text = "Notifications Controller"
            label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
